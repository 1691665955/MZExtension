Pod::Spec.new do |s|
s.name = 'MZExtension'
s.version = '1.0.1'
s.license = 'MIT'
s.summary = 'Some categorys and custom objects for iOS.'
s.homepage = 'https://github.com/1691665955/MZExtension'
s.authors = { 'MZ' => '1691665955@qq.com' }
s.source = { :git => "https://github.com/1691665955/MZExtension.git", :tag => s.version.to_s}
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'MZExtension/MZExtension/**'
# s.source_files = 'MZExtension/**/*.{h,m}'
s.requires_arc = true
end