#
# Be sure to run `pod lib lint ZHKUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZHKUIKit'
  s.version          = '0.1.3'
  s.summary          = '项目常用 UI 部件轮子'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
公司项目常用 UI 部件轮子
                       DESC

  s.homepage         = 'https://github.com/ZHK1024/ZHKUIKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ZHK1024' => 'ZHK1024@foxmail.com' }
  s.source           = { :git => 'https://github.com/ZHK1024/ZHKUIKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.default_subspecs = 'TableView'
  s.subspec 'TableView' do |ts|

    ts.source_files = 'ZHKUIKit/Classes/UITableView/**/**'
  end

  s.ios.deployment_target = '8.0'
  
  s.source_files = 'ZHKUIKit/Classes/**'
  
  
  
  # s.resource_bundles = {
  #   'ZHKUIKit' => ['ZHKUIKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Masonry'
end
