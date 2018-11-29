
Pod::Spec.new do |s|

	s.name = "Style"
	s.version = "0.0.1"
	s.swift_version = "4.2"
	s.summary = "Tyler Style"
	s.homepage = "https://github.com/IgorMuzyka/Tyler.Style"
	s.source = { :git => "https://github.com/IgorMuzyka/Tyler.Style.git", :tag => s.version.to_s }
	s.license = { :type => "MIT", :file => "LICENSE" }
	s.author = { 'igormuzyka' => "igormuzyka42@gmail.com" }
	s.source_files = "Sources/Style/*"

	s.dependency "Tag"
	s.dependency "Variable"

	s.osx.deployment_target = "10.10"
	s.ios.deployment_target = "9.0"
	s.tvos.deployment_target = "9.0"
	s.watchos.deployment_target = "3.0"

end
