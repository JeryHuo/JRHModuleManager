Pod::Spec.new do |s|
    s.name                  = 'JRHModuleManager'
    s.version               = '1.0.0'
    s.summary               = 'AppDelegate瘦身方案'
    s.homepage              = 'https://github.com/JeryHuo/JRHModuleManager'
    s.license               = 'MIT'
    s.author                = 'JeryHuo'
    s.social_media_url      = 'https://github.com/JeryHuo'
    s.platform              = :ios, '8.0'
    s.swift_version         = '4.0'
    s.source                = { :git => 'git@github.com:JeryHuo/JRHModuleManager.git', :tag => 'v1.0.0' }
    s.source_files          = 'JRHModuleManager/*'
    s.framework             = 'UIKit'
    s.requires_arc          = true
end


