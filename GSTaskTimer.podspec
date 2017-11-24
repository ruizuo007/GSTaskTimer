#
# Be sure to run `pod lib lint GSTaskTimer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GSTaskTimer'
  s.version          = '1.0.0'
  s.summary          = 'Replace NSTimer'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                       An replacement for NSTimer
                       DESC

  s.homepage         = 'https://github.com/ruizuo007/GSTaskTimer.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ruizuo007' => 'ruizuo007@gmail.com' }
  s.source           = { :git => 'https://github.com/ruizuo007/GSTaskTimer.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'GSTaskTimer/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GSTaskTimer' => ['GSTaskTimer/Assets/*.png']
  # }

  s.public_header_files = 'GSTaskTimer/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
