#
# Be sure to run `pod lib lint DiaryFoundation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DiaryFoundation'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DiaryFoundation.'
  s.homepage         = 'https://github.com/michaelkho/DiaryFoundation'
  s.author           = { 'michaelkho' => 'michael.kho@paypay-corp.co.jp' }
  s.source           = { :git => 'https://github.com/michaelkho/DiaryFoundation.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'DiaryFoundation/**/*.{h,m,swift}'
end
