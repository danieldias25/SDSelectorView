#
# Be sure to run `pod lib lint SDSelectorView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SDSelectorView'
  s.version          = '0.1.0'
  s.summary          = 'An easy way to make a selector gallery in iOS-Swift applications.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
An easy way to make a selector gallery in iOS-Swift applications that shows images and let users interact with it in a very intuitive way.
                       DESC

  s.homepage         = 'https://github.com/danieldias25/SDSelectorView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'danieldias25' => 'daniel.dias.e@gmail.com' }
  s.source           = { :git => 'https://github.com/danieldias25/SDSelectorView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SDSelectorView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SDSelectorView' => ['SDSelectorView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
