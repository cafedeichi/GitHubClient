# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
target 'GitHubClient' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'Alamofire', '~> 4.8.2'
  pod 'AlamofireImage', '~> 3.5.2'
  pod 'KRProgressHUD', '~>3.4.1'
  pod 'PromiseKit', '~>6.8.4'
  pod 'PullToRefresher', '~>3.1.0'
  pod 'ReSwift', '~> 4.1.1'
  pod 'SwiftGen', '~> 6.1.0'
  pod 'SwiftLint', '~> 0.32.0'
  
end

post_install do | installer |
  installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
          config.build_settings['VALID_ARCHS'] = 'arm64'
      end
  end
end
