#
#  Be sure to run `pod spec lint UICommunicator.swift.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "UICommunicator.swift"
  s.version      = "0.0.2"
  s.summary      = "组件化模块交互组件"
  s.module_name  = "UICommunicator"

  s.description  = <<-DESC
                   组件化模块交互组件，详见REAME.md 
                   DESC

  s.homepage     = "https://github.com/zevwings/UICommunicator.swift.git"
  s.license      = "MIT"
  s.author       = { "zevwings" => "zev.wings@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/zevwings/UICommunicator.swift.git", :tag => "#{s.version}" }
  s.source_files = "UICommunicator/**/*.{swift,h,m}"
  s.requires_arc = true

end
