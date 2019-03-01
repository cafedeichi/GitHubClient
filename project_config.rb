#!/usr/bin/env ruby

require 'rubygems'
require 'xcodeproj'
require './scheme_config.rb'

name = ARGV[0]

proj = Xcodeproj::Project.open(name + '.xcodeproj')
target = proj.targets.find { |item| item.to_s == name }

# create Build Phase
phase = proj.new(Xcodeproj::Project::Object::PBXShellScriptBuildPhase)
phase.name = 'Run Script'
phase.shell_script = '"${PODS_ROOT}/SwiftLint/swiftlint"'

# add Build Phase
target.build_phases << phase
puts 'SwiftLint integrated'

# remove unnecessary files
proj.files.map do |item|
  case item.name
  when  'Podfile', '.swiftlint.yml', 'project_config.rb', 'scheme_config.rb' then
    item.remove_from_project
  end
end
puts 'Unnecessary file references removed'

proj.save

exec('pod install')
