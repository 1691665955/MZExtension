Pod::Spec.new do |s|
s.name = 'MZExtension'
s.version = '1.1.8'
s.license = 'MIT'
s.summary = 'Some categorys and custom objects for iOS.'
s.homepage = 'https://github.com/1691665955/MZExtension'
s.authors = { 'MZ' => '1691665955@qq.com' }
s.source = { :git => "https://github.com/1691665955/MZExtension.git", :tag => s.version}
s.requires_arc = true
s.ios.deployment_target = '8.0'
# s.source_files = 'MZExtension/**/*.{h,m}'

s.subspec 'Base' do |Base|
  Base.source_files = 'MZExtension/Base/*.{h,m}'
end

s.subspec 'Category' do |Category|
  Category.source_files = 'MZExtension/Category/*.{h,m}'
end

s.subspec 'Extends' do |Extends|
  Extends.source_files = 'MZExtension/Extends/*.{h,m}'
end

end