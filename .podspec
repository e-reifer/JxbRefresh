Pod::Spec.new do |s|
  s.name             = 'JxbRefresh'
  s.version          = '2.1'
  s.license          = 'MIT'
  s.summary          = 'Give pull-to-refresh to any UIScrollView with 1 line of code. Written in Swift'
  s.homepage         = 'http://www.jxb.name'
  s.authors          = { 'Peter' => 'i@jxb.name' }
  s.source           = { git: 'https://github.com/e-reifer/JxbRefresh.git', tag: s.version.to_s }
  
  s.ios.deployment_target = '11.0' # Set to iOS 11 for compatibility
  s.source_files     = 'JxbRefresh/JxbRefresh/*.*'
  s.requires_arc     = true
end
