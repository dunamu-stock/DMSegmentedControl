Pod::Spec.new do |s|
    s.name          = 'DMSegmentedControl'
    s.version       = '1.2.1'
    s.summary       = 'A Swift conversion of https://github.com/HeshamMegid/HMSegmentedControl'
    s.swift_version = '4.2'
    s.homepage      = 'https://github.com/DominicMDev/DMSegmentedControl'
    s.license       = { :type => 'MIT', :file => 'LICENSE.md' }
    s.authors       = { "Dominic Miller" => "dominicmdev@gmail.com", "Hesham Abd-Elmegid" => "hesham.abdelmegid@gmail.com" }
    s.source        = { :git => "https://github.com/DominicMDev/DMSegmentedControl.git", :tag => s.version }
    s.platform      = :ios, '10.0'
    s.requires_arc  = true
    s.source_files  = 'DMSegmentedControl/*.swift'
    s.framework     = 'QuartzCore'
end
