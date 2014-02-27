Pod::Spec.new do |s|
  s.name          = "QVLocalization"
  s.version       = "1.0.0"
  s.summary    = "Localization system for iOS"
  s.homepage   = "https://github.com/Qlovr/QVLocalization"
  s.license       = 'MIT'
  s.author      = {
  'AGGRESSIVE MEDIOCRITY'               => 'http://aggressive-mediocrity.blogspot.com/',
  'Worakarn Isaratham'	=> 'http://github.com/arkorwan' }
  s.source       = { :git => 'https://github.com/Qlovr/QVLocalization.git' }
  s.platform       = :ios
  s.source_files  = 'QVLocalization'
  s.framework   = 'UIKit'
  s.requires_arc = true
end