#
# Be sure to run `pod lib lint RKImageView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RKImageView'
  s.version          = '0.1.0'
  s.summary          = 'Zooming imageView as in Instagram.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Get the zooming effect as in Instagram. Zoom and pan images simultaneously.
Image is restored to original size and position when zooming ends.
                       DESC

  s.homepage         = 'https://github.com/radhakrishnapai/RKImageView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Radhakrishna Pai' => 'radhakrishnapai09@gmail.com' }
  s.source           = { :git => 'https://github.com/radhakrishnapai/RKImageView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'RKImageView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RKImageView' => ['RKImageView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
