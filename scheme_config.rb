#!/usr/bin/env ruby

require 'rubygems'
require 'xcodeproj'

def setupScheme(name)

  develop = 'Develop'
  staging = 'Staging'
  production = 'Production'

  proj = Xcodeproj::Project.open(name + '.xcodeproj')
  target = proj.targets.find { |item| item.to_s == name }

  # set bundle display name in Info.plist
  info_plist_path = name + '/Info.plist'
  info_plist = Xcodeproj::Plist.read_from_path(info_plist_path)
  bundle_display_name = info_plist['CFBundleDisplayName']

  if bundle_display_name == nil then
    info_plist['CFBundleDisplayName'] = info_plist['CFBundleName'] + '$(BUNDLE_ID_SUFFIX)'
  else
    info_plist['CFBundleDisplayName'] = bundle_display_name + '$(BUNDLE_ID_SUFFIX)'
  end
  Xcodeproj::Plist.write_to_path(info_plist, info_plist_path)

  #recreate schemes
  proj.recreate_user_schemes(visible = true)

  # change Configuration Name  Debug -> Develop
  proj.build_configurations[0].name = develop
  target.build_configurations[0].name = develop
  # change Configuration Name  Release -> Production
  proj.build_configurations[1].name = production
  target.build_configurations[1].name = production

  scheme_name = name + '.xcscheme'
  scheme_path = Xcodeproj::XCScheme.user_data_dir(proj.path) + scheme_name

  if FileTest.exist?(scheme_path) then
    File.delete(scheme_path)
  end

  # create Production scheme
  productionScheme = Xcodeproj::XCScheme.new
  productionScheme.add_build_target(target)
  productionScheme.set_launch_target(target)

  productionScheme.launch_action.build_configuration = production
  productionScheme.test_action.build_configuration = production
  productionScheme.profile_action.build_configuration = production
  productionScheme.analyze_action.build_configuration = production
  productionScheme.archive_action.build_configuration = production

  productionScheme.save_as(proj.path, name)

  # create Develop scheme
  developScheme = Xcodeproj::XCScheme.new
  developScheme.add_build_target(target)
  developScheme.set_launch_target(target)

  developScheme.launch_action.build_configuration = develop
  developScheme.test_action.build_configuration = develop
  developScheme.profile_action.build_configuration = develop
  developScheme.analyze_action.build_configuration = develop
  developScheme.archive_action.build_configuration = develop

  developScheme.save_as(proj.path, name + '.dev')

  # create Staging scheme
  stagingScheme = Xcodeproj::XCScheme.new
  stagingScheme.add_build_target(target)
  stagingScheme.set_launch_target(target)

  stagingScheme.launch_action.build_configuration = staging
  stagingScheme.test_action.build_configuration = staging
  stagingScheme.profile_action.build_configuration = staging
  stagingScheme.analyze_action.build_configuration = staging
  stagingScheme.archive_action.build_configuration = staging

  stagingScheme.save_as(proj.path, name + '.stg')


  # add build configuration
  proj.add_build_configuration(staging, :release)
  target.add_build_configuration(staging, :release)

  # setup project build_configurations
  proj.build_configurations.map do |item|
    case item.name
    when develop then
    item.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] = 'DEVELOP=1'
    item.build_settings['SWIFT_ACTIVE_COMPILATION_CONDITIONS'] = 'DEVELOP'
    item.build_settings['BUNDLE_ID_SUFFIX'] = '.dev'

    when staging then
      item.build_settings.update(proj.build_settings(production))
      item.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] = 'STAGING=1'
      item.build_settings['SWIFT_ACTIVE_COMPILATION_CONDITIONS'] = 'STAGING'
      item.build_settings['BUNDLE_ID_SUFFIX'] = '.stg'
    end
  end

  # get bundle ID
  bundle_id = target.build_settings(production)['PRODUCT_BUNDLE_IDENTIFIER']
  # setup target build_configurations
  target.build_configurations.map do |item|
    item.build_settings['PRODUCT_BUNDLE_IDENTIFIER'] = bundle_id + '$(BUNDLE_ID_SUFFIX)'

    if item.name == staging then
      item.build_settings.update(target.build_settings(production))
    end
  end

  proj.save
  puts 'Setting up schemes completed'

  # deintegrate when installed pods exist
  if FileTest.exist?('Pods') then
    exec('pod deintegrate ' + name + '.xcodeproj')
  end
end

if ARGV[0] != nil then
  setupScheme(ARGV[0])
else
  puts 'プロジェクト名を指定してください。'
end
