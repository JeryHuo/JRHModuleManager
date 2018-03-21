Pod::Spec.new do |s|

s.name = "JRHModuleManager"
s.version = "1.0.0"
s.ios.deployment_target = '8.0'
s.summary = "AppDelegate瘦身方案"
s.homepage = "https://github.com/JeryHuo/JRHModuleManager"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "JeryHuo" => jeryhuo@gmail.com" }
s.social_media_url = "https://github.com/JeryHuo"
s.source = { :git => "git@github.com:JeryHuo/JRHModuleManager.git", :tag => s.version }
s.source_files = "JRHModuleManager/*.swift"
#s.resources = "YJSettingTableView/YJSettingTableView.bundle"
s.requires_arc = true

end


