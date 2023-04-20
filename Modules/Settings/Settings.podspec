#
# Be sure to run `pod lib lint Settings.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Settings'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Settings.'
  s.homepage         = 'https://github.com/michaelkho/Settings'
  s.author           = { 'michaelkho' => 'michael.kho@paypay-corp.co.jp' }
  s.source           = { :git => 'https://github.com/michaelkho/Settings.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'Settings/**/*.{h,m,swift}'

  s.resource_bundles = {
    'SettingsResources' => ['Settings/**/*.xib',
                               'SettingsResources/**/*.xib',
                               'SettingsResources/Images.xcassets']
  }

  s.dependency 'DiaryFoundation'
end
