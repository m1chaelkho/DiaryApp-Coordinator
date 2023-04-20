#
# Be sure to run `pod lib lint Authentication.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Authentication'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Authentication.'
  s.homepage         = 'https://github.com/michaelkho/Authentication'
  s.author           = { 'michaelkho' => 'michael.kho@paypay-corp.co.jp' }
  s.source           = { :git => 'https://github.com/michaelkho/Authentication.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'Authentication/**/*.{h,m,swift}'

  s.resource_bundles = {
    'AuthenticationResources' => ['Authentication/**/*.xib',
                               'AuthenticationResources/**/*.xib',
                               'AuthenticationResources/Images.xcassets']
  }

  s.dependency 'DiaryFoundation'
end
