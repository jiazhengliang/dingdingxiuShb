
Pod::Spec.new do |spec|



  spec.name         = "dingdingxiuSHB"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of dingdingxiuSHB."


  spec.description  = <<-DESC
  shuoming
                   DESC

  spec.homepage     = "http://EXAMPLE/dingdingxiuSHB"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"



spec.frameworks = 'AVFoundation', 'UIKit'

  spec.license      = "MIT"

  spec.author             = { "jones" => "530231923@qq.com" }




  spec.source       = { :git => "http://EXAMPLE/dingdingxiuShb.git", :tag => "#{spec.version}" }


  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"

end
