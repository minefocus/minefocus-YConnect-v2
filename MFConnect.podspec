Pod::Spec.new do |s|
  s.name = 'MFYConnect'
  s.version = '1.0.1'
  s.summary = 'minefocus yahoo login'
  s.license = 'MIT'
  s.homepage = 'https://github.com/minefocus/minefocus-YConnect-v2'
  s.authors = { 'MineFocus Software Foundation' => 'cong.wang3@pactera.com' }
  s.source = { :git => 'https://github.com/minefocus/minefocus-YConnect-v2.git', :tag => s.version }

  s.ios.deployment_target = '10.0'
  s.source_files = 'Source/**/*.{h,m}'
end
