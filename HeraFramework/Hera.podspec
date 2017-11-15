
Pod::Spec.new do |s|

  s.name         = "Hera"
  s.version      = "1.0.0"
  s.summary      = "Weixin Small App Framework"
  s.description  = "A Framework For Weixin Small App running"
  s.homepage     = "http://www.weidian.com"
  s.license      = "MIT"
  s.author       = { "sunyu" => "sunyu@weidian.com", "wangyiqiao" => "wangyiqiao@weidian.com" }
  s.platform     = :ios, "9.0"
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/sunyuxidian/weixinSmallApp.git", :tag => s.version.to_s }
  s.source_files  = "HeraFramework", "HeraFramework/Hera/**/*.{h,m}"
  s.public_header_files = "HeraFramework/Hera/**/*.h"
  s.resource = "HeraFramework/Resources/*.bundle"
  s.requires_arc = true

  s.dependency "Reachability", "~> 3.2"
  s.dependency "MJRefresh", "~> 3.1.9"
  s.dependency "ZipArchive", "~> 1.4.0"
  s.dependency "AFNetworking", "~> 3.0"

end
