#
# Be sure to run `pod lib lint BHVideoManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BHVideoManager'
  s.version          = '1.0'
  s.summary          = 'Video tool manager'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/BandarHL/BHVideoManager'
  s.author           = { 'BandarHelal' => 'bandarhelal190@gmail.com' }
  s.source           = { :git => 'https://github.com/BandarHL/BHVideoManager.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/BandarHL'
  s.source_files = 'BHVideoManager/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BHVideoManager' => ['BHVideoManager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'CoreMedia', 'AVFoundation', 'AVKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
