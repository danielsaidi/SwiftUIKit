# Run `pod lib lint SwiftUIBlurView.podspec' to ensure this is a valid spec.

Pod::Spec.new do |s|
  s.name             = 'SwiftUIBlurView'
  s.version          = '0.2.0'
  s.swift_versions   = ['5.1']
  s.summary          = 'SwiftUIBlurView lets you use UIBlurEffect in SwiftUI.'

  s.description      = <<-DESC
  SwiftUIBlurView lets you use UIBlurEffect in SwiftUI. This
  makes it easy to apply other blur effects than the basic
  ones that are defined in SwiftUI.
                       DESC

  s.homepage         = 'https://github.com/danielsaidi/SwiftUIBlurView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Daniel Saidi' => 'daniel.saidi@gmail.com' }
  s.source           = { :git => 'https://github.com/danielsaidi/SwiftUIBlurView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/danielsaidi'

  s.swift_version = '5.1'
  s.ios.deployment_target = '13.0'
  s.source_files = 'Sources/**/*.swift'
end
