#
# Be sure to run `pod lib lint BHVideoManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BHVideoManager'
  s.version          = '2.0'
  s.summary          = 'Video tool manager'

  s.homepage         = 'https://github.com/BandarHL/BHVideoManager'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'BandarHL' => 'bandarhl' }
  s.source           = { :git => 'https://github.com/BandarHL/BHVideoManager.git', :tag => s.version.to_s }
   s.social_media_url = 'https://twitter.com/BandarHL'

  s.ios.deployment_target = '8.0'

  s.source_files = 'BHVideoManager/Classes/**/*'
  
   s.frameworks = 'UIKit', 'CoreMedia', 'AVFoundation', 'AVKit'
end
