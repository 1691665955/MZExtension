Pod::Spec.new do |s|
s.name = 'MZExtension'
s.version = '2.1.9'
s.license = 'MIT'
s.summary = 'Some categorys and custom objects for iOS.'
s.homepage = 'https://github.com/1691665955/MZExtension'
s.authors = { 'MZ' => '1691665955@qq.com' }
s.source = { :git => "https://github.com/1691665955/MZExtension.git", :tag => s.version}
s.requires_arc = true
s.ios.deployment_target = '8.0'
# s.source_files = 'MZExtension/**/*.{h,m}','MZExtension/**/**/*.{h,m}'

s.subspec 'Base' do |ss|
  ss.source_files = 'MZExtension/Base/*.{h,m}'
end

s.subspec 'Category' do |ss|
  ss.source_files = 'MZExtension/Category/*.{h,m}'
end

s.subspec 'Tool' do |ss|
  ss.source_files = 'MZExtension/Tool/*.{h,m}'
end

s.subspec 'Extends' do |ss|
  ss.subspec 'MZBannerView' do |sss|
  	sss.source_files = 'MZExtension/Extends/MZBannerView/*.{h,m}'
  	sss.dependency 'SDWebImage'
  end

  ss.subspec 'MZImageBrowsing' do |sss|
  	sss.source_files = 'MZExtension/Extends/MZImageBrowsing/*.{h,m}'
    sss.dependency 'SDWebImage'
  end

  ss.subspec 'MZCircleProgress' do |sss|
  	sss.source_files = 'MZExtension/Extends/MZCircleProgress/*.{h,m}'
  end

  ss.subspec 'MZMarqueeLabel' do |sss|
  	sss.source_files = 'MZExtension/Extends/MZMarqueeLabel/*.{h,m}'
  end

  ss.subspec 'MZMobileField' do |sss|
  	sss.source_files = 'MZExtension/Extends/MZMobileField/*.{h,m}'
  end

  ss.subspec 'MZTableView' do |sss|
  	sss.source_files = 'MZExtension/Extends/MZTableView/*.{h,m}'
  end

  ss.subspec 'MZTextField' do |sss|
  	sss.source_files = 'MZExtension/Extends/MZTextField/*.{h,m}'
  end

  ss.subspec 'MZTextView' do |sss|
  	sss.source_files = 'MZExtension/Extends/MZTextView/*.{h,m}'
  end

  ss.subspec 'MZWaveView' do |sss|
  	sss.source_files = 'MZExtension/Extends/MZWaveView/*.{h,m}'
  end

  ss.subspec 'MZAlertController' do |sss|
  	sss.source_files = 'MZExtension/Extends/MZAlertController/*.{h,m}'
  end

  ss.subspec 'MZDrawBoardView' do |sss|
    sss.source_files = 'MZExtension/Extends/MZDrawBoardView/*.{h,m}'
  end
  
  ss.subspec 'MZLongTapButton' do |sss|
    sss.source_files = 'MZExtension/Extends/MZLongTapButton/*.{h,m}'
  end

end

end
