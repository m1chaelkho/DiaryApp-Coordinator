#
# Be sure to run `pod lib lint DiaryContent.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DiaryContent'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DiaryContent.'
  s.homepage         = 'https://github.com/michaelkho/DiaryContent'
  s.author           = { 'michaelkho' => 'michael.kho@paypay-corp.co.jp' }
  s.source           = { :git => 'https://github.com/michaelkho/DiaryContent.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'DiaryContent/**/*.{h,m,swift}'

  s.resource_bundles = {
    'DiaryContentResources' => ['DiaryContent/**/*.xib',
                               'DiaryContentResources/**/*.xib',
                               'DiaryContentResources/Images.xcassets']
  }

  s.dependency 'DiaryFoundation'
end
