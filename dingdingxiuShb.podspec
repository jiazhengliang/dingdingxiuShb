
Pod::Spec.new do |spec|



  spec.name         = "dingdingxiuSHB"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of dingdingxiuSHB."


  spec.description  = <<-DESC
                   DESC

  spec.homepage     = "http://EXAMPLE/dingdingxiuSHB"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  spec.license      = "MIT"

  spec.author             = { "jones" => "530231923@qq.com" }




  spec.source       = { :git => "http://EXAMPLE/dingdingxiuSHB.git", :tag => "#{spec.version}" }


  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"

  spec.library = 'sqlite3', 'stdc++.6.0.9', 'z'

  spec.dependency 'SnapKitExtend'
  spec.dependency 'Then'
  spec.dependency 'Moya'
  spec.dependency 'HandyJSON', '5.0.0-beta.1'
  spec.dependency 'Kingfisher'
  spec.dependency 'Reusable'
  spec.dependency 'LLCycleScrollView'
  spec.dependency 'MJRefresh'
  spec.dependency 'MBProgressHUD'
  spec.dependency 'HMSegmentedControl'
  spec.dependency 'IQKeyboardManagerSwift'
  spec.dependency 'EmptyDataSet-Swift'
  spec.dependency "UINavigation-SXFixSpace"
  spec.dependency "RxSwift"
  spec.dependency 'SVProgressHUD'
  spec.dependency 'SwiftyJSON'
  spec.dependency 'XHToastSwift'
  spec.dependency 'YYKit'
  spec.dependency 'SnapKit'
  spec.dependency 'RxSwift'
  spec.dependency 'RxCocoa'
  spec.dependency 'MJRefresh'
  spec.dependency 'Kingfisher'

end
