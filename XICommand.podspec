Pod::Spec.new do |s|
  s.name         = "XICommand"
  s.version      = "1.0.0"
  s.summary      = "Xcode interface command.The core function is to support the dark mode through the XIB file."
  s.homepage     = "https://github.com/Meterwhite/XICommand"
  s.license      = "MIT"
  s.author       = { "Meterwhite" => "meterwhite@outlook.com" }
  s.source        = { :git => "https://github.com/Meterwhite/XICommand.git", :tag => s.version.to_s }
  s.source_files  = "XICommand/**/*.{h,m}"
  s.requires_arc  = true
  
  s.ios.deployment_target = "8.2"
  s.osx.deployment_target = "10.12"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
end
