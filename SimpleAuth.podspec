Pod::Spec.new do |s|
  s.name         = 'SimpleAuth'
  s.version      = '0.4.0'
  s.summary      = 'Simple social authentication for iOS.'
  s.homepage     = 'https://github.com/calebd/SimpleAuth'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Caleb Davenport' => 'calebmdavenport@gmail.com' }
  s.source       = { :git => 'https://github.com/calebd/SimpleAuth.git', :tag => "v#{s.version}" }
  s.requires_arc = true
  s.platform     = :ios, '8.0'

  s.subspec 'Core' do |ss|
    ss.source_files = 'Pod/Core'
    ss.public_header_files = 'Pod/Core/SimpleAuth.h', 'Pod/Core/SimpleAuthDefines.h'
    ss.dependency 'ReactiveCocoa'
    ss.dependency 'CMDQueryStringSerialization'

    ss.ios.frameworks = 'UIKit'
    ss.ios.source_files = 'Pod/Core/ios'
    ss.ios.resource_bundle = { 'SimpleAuth' => [ 'Pod/Resources/*.lproj' ] }
  end

  s.subspec 'Facebook' do |ss|
    ss.dependency 'SimpleAuth/Core'
    ss.frameworks = 'Accounts', 'Social'
    ss.source_files = 'Pod/Providers/Facebook'
    ss.private_header_files = 'Pod/Providers/Facebook/*.h'
  end

  s.subspec 'FacebookWeb' do |ss|
    ss.dependency 'SimpleAuth/Core'
    ss.source_files = 'Pod/Providers/FacebookWeb'
    ss.private_header_files = 'Pod/Providers/FacebookWeb/*.h'
  end

end
