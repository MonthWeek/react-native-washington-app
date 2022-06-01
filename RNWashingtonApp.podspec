
Pod::Spec.new do |s|
  s.name         = "RNWashingtonApp"
  s.version      = "1.0.4"
  s.summary      = "this is designed for washington app"
  s.description  = <<-DESC
                  this is designed for washington app
                   DESC
  s.homepage     = "https://github.com/MonthWeek/react-native-washington-app"
  s.license      = "MIT"
  s.author       = { "author" => "xxx@example.com" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/MonthWeek/react-native-washington-app.git", :tag => "master" }
  s.source_files = "ios/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"

end

  