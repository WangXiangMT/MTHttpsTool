Pod::Spec.new do |s|
s.name     = 'MTHttpsTool'
s.version  = '1.1'
s.license  = { :type => "MIT", :file => "LICENSE" }
s.summary  = 'An httpTool on iOS.'
s.homepage = 'https://github.com/WangXiangMT/MTHttpsTool'
s.authors  = { "WangXiangMT" => "1137781435@qq.com" }
s.source   = { :git => 'https://github.com/WangXiangMT/MTHttpsTool.git', :tag => 1.1 }
s.platform     = :ios, "8.0"
s.ios.deployment_target = '8.0'
s.source_files = "Classes/{*.h,*.m}"
s.dependency 'AFNetworking', '~> 3.0'
s.framework  = "UIKit"
s.requires_arc = true
end
