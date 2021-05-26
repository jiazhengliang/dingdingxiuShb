
Pod::Spec.new do |spec|



  spec.name         = "dingdingxiuSHB"
  spec.version      = "0.0.1"
  spec.summary      = "所有项目都可以用的公共库"



  spec.homepage     = "https://github.com/jiazhengliang/dingdingxiuSHB"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"



spec.frameworks = 'AVFoundation', 'UIKit'

  spec.license      = "MIT"

  spec.author             = { "jones" => "530231923@qq.com" }




  spec.source       = { :git => "https://github.com/296019487@qq.com", :tag => "#{spec.version}" }


  spec.source_files  = "dingdingxiuSHB", "dingdingxiuSHB/core/**/*.{h,m}"

end
