
Pod::Spec.new do |s|
  s.name         = "RNWashingtonApp"
  s.version      = "1.0.0"
  s.summary      = "this is designed fo"
  s.description  = <<-DESC
                  this is designed fo
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "xxx@example.com" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/author/RNWashingtonApp.git", :tag => "master" }
  s.source_files  = "RNWashingtonApp/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  