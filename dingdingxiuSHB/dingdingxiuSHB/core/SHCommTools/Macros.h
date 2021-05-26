

#ifndef Macros_h
#define Macros_h

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#define _weakself __weak typeof(self) weakself = self
#define BackGroundColor    UIColorFromHEXA(0xf5f5f5,1)
#define ug_randomColor    [UIColor colorWithRed:random()%255/ 255.0f green:random()%255/ 255.0f blue:random()%255/ 255.0f alpha:1]

// 颜色
#define UIColorFromHEXA(hex,a) [UIColor colorWithRed:((hex & 0xFF0000) >> 16) / 255.0f green:((hex & 0xFF00) >> 8) / 255.0f blue:(hex & 0xFF) / 255.0f alpha:a]
#define UIColorFromRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define  UIColorHexFromRGB(hex) UIColorFromHEXA(hex,1.0)
// 系统默认字体设置和自选字体设置

#define CustomFontSize(fontname,fontsize) [UIFont fontWithName:fontname size:fontsize]

#define UG_WEAKSELF __weak typeof(self) weakSelf = self;

//获取图片资源

// 等比例缩放系数
#define KEY_WINDOW    ([UIApplication sharedApplication].keyWindow)
#define SCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define kScreenWidth    SCREEN_WIDTH
#define kScreenHeight   SCREEN_HEIGHT
#define SCREEN_SCALE  ((SCREEN_WIDTH > 414) ? (SCREEN_HEIGHT/375.0) : (SCREEN_WIDTH/375.0))
#define Handle(x)        ((x)*SCREEN_SCALE)
#define Handle_width(w)  ((w)*SCREEN_SCALE)
#define Handle_height(h) ((h)*SCREEN_SCALE)
// 网络状态
#define NetWork_MobileNet  @"MobileNet" //3G|4G
#define NetWork_WIFI       @"WIFI" //WIFI
#define NetWork_NONET      @"NONET" //NONET
#define NetworkChangeNotification @"NetworkChangeNotification"


//com.TRDA.LeBoLive
//com.TRDA.LeBoLiveShow
#pragma mark --------------------------protocal----------------------------
/**
 IPHONE_X适配
 */

#define kTABBAR_HEIGHT (IPHONE_X?(49.f+34.f):49.f)

/**
 Return the statusBar height.
 */
#define kSTATUSBAR_HEIGHT (IPHONE_X?44.0f:20.f)

#define LiveRemandViewY   (IPHONE_X?44.0f:0.f)

/**
 Return the navigationBar height.
 */
#define kNAVIGATION_HEIGHT (44.f)

/**
 Return the (navigationBar + statusBar) height.
 */
#define kNavigationHeight (IPHONE_X?88.0f:64.f)

/**
 Return 没有tabar 距 底边高度
 */
#define BOTTOM_SPACE_HEIGHT (IPHONE_X?34.0f:0.0f)

// 通用控件左右间隔
#define kSpaceToLeftOrRight Handle(10)

// 底部条高度
#define kBottomViewHeight 48


#define  AFAppDotNetAPIBaseURLString  @""
//#define BaseURLHttpIp  @"http://192.168.0.16:9999/yuren"




#define appVersion1 0
// 1 正式环境 0 测试环境
#define applyPayStore 0

#define BaseURLHttpIp [[SavaInfoTools sharedInstance] getObjectValueFromKey:@"BaseURLHttpIpkey"]


#define UserDefault [NSUserDefaults standardUserDefaults]

#pragma mark -------------------------  工程配置相关 --------------------


#define CString(k)  [[HNSkinThemeManager shareSkinThemeManager] skinColorStringWithKey:k]
#define ImageString(k)  [[HNSkinThemeManager shareSkinThemeManager] skinImageNameWithKey:k]
#define CurrentThemeIsWhite [[[HNSkinThemeManager shareSkinThemeManager] getAppSkinTheme] isEqualToString:@"white"]

#define directoryPath(name) [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:name]

//腾讯云存储
#define kPictureAppID @"1304465545"
#define kPictureRegion @"ap-shanghai"
//腾讯云的图片 不可以生成缩略图的桶
#define kPictureBucket @"yoga-zh-1304465545"

#define gaodeMapKey     @"8549b64a8ae85170e4591fb3a000ea4a"


#define WXAppId          @"wx0d7ee82ab59c731c"
#define WXAppSecret      @"060466a2a33c85a1aa3bdcb1faa6f28e"
#define QQAppId          @"1109665625"
#define QQappkey      @"Olc6wZPDFZoqhX1x"

#pragma  mark   -----------------错误码
#define  NOEnoughCODE      10024  //  用户余额不足；

#define SZRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define SZHexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
#define SZRGBAlpha(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(1)]

#define LStringInt(x) [NSString stringWithFormat:@"%li",(long)x]

#define LStringDouble(x) [NSString stringWithFormat:@"%lf",x]

#define LNumberInteger(x) [NSNumber numberWithInteger:x]

#define LStringFloat02(x) [NSString stringWithFormat:@"%0.2f",x]

#define SystemFontSize(fontsize) [UIFont systemFontOfSize:(fontsize)]

#define GetImage(name) [UIImage imageNamed:(name)]

#define SystemBlodFontSize(fontsize) [UIFont fontWithName:@"Helvetica-Bold" size:(fontsize)]


// 判断是否为iPhone X 系列  这样写消除了在Xcode10上的警告。
#define IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define HexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
#define RGBAlpha(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(1)]

#define NavigationBarColor [UIColor colorWithRed:233/255.0 green:118/255.0 blue:20/255.0 alpha:1]
#define NavigationBarShadowColor [UIColor blackColor]
#define NavigationBarWidth screen_width
#define NavigationBarHeight (CGFloat)(IPHONE_X?(88.0):(64.0))

#define NavigationBarTitleFont [UIFont systemFontOfSize:17*KWIDTH]
#define NavigationBarTitleColor BlackCustomColor

#define IsNeedDes  YES

#define appLanguage     @"user_appLanguage"

#define ASLocalizedString(key)  [NSString stringWithFormat:@"%@", [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:appLanguage]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"InfoPlist"]]

#define kRandomColor [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1]

#define segmentHeight 45*KWIDTH

#define Content_Y 64
#define Header_Y 55
#define Content_Height [[UIScreen mainScreen] bounds].size.height-64
#define app_version  @"1.1"

#define pictureWidth (screen_width- 55)/5
#define TabBar_Height 50
//屏幕的宽
#define screen_width [UIScreen mainScreen].bounds.size.width
//屏幕的高
#define screen_height [UIScreen mainScreen].bounds.size.height
//屏幕尺寸比
#define SCREEN_RATIO [UIScreen mainScreen].bounds.size.width/320.0

#define SCREEN_RATIO_IPHONE6 [UIScreen mainScreen].bounds.size.width/375.0

#define ISIPHONE6PLUS (([UIScreen mainScreen].bounds.size.width==414)?(YES):(NO))
#define ISIPHONE6 (([UIScreen mainScreen].bounds.size.width>320)?(YES):(NO))
#define ISIPHONE4 (([UIScreen mainScreen].bounds.size.height == 480)?(YES):(NO))
#define ISIPHONE5 (([UIScreen mainScreen].bounds.size.height == 568)?(YES):(NO))

#define KWIDTH screen_width/375
//#define KWIDTH 1

#define KHeight screen_height/568
#define lineHight 0.5


#define versionNo  1
#define MARGIN 5

#define LWORD_FONT_SIZE 14.0f
#define SWORD_FONT_SIZE 12.0f
#define DESC_FONT_SIZE  11.0f
//图片缓存的最大缓存量
#define image_max_cache_size 500 * 1024 * 1024
//内存大小
#define memory_capacity 4 * 1024 * 1024
//物理内存大小
#define disk_capacity 20 * 1024 * 1024

#define url_go_to_iTunes @"https://itunes.apple.com/cn/app/id1389653534?mt=8"

//tabbar切换通知
#define changeTabBarNotification @"changeTabBarNotification"

#define buttonBgColor  HexRGBAlpha(0x4e6cef,1)

#define buttonBgCancelColor  HexRGBAlpha(0xBFBFBF,1)


#define j_titleColor HexRGBAlpha(0xffffff,1)

#define lineBgColor HexRGBAlpha(0x3d4750,1)

#define titleMeColor HexRGBAlpha(0x292a2a,1)

#define titleResignColor HexRGBAlpha(0x3893f9,1)


#define fontPingFang @"PingFangSC-Regular"
#define tableCellLineColor HexRGBAlpha(0xededed,1)

//navBar文字颜色
#define navbar_titletext_color RGBColor(51,51,51)
#define BlackCustomColor    HexRGBAlpha(0x464646,1)

#define buyDetailBackColor HexRGBAlpha(0xf5f5f5,1)

#define titleBuyDetail HexRGBAlpha(0x0A0909,1)
#define titleBuyHeader HexRGBAlpha(0x272323,1)
#define titleBuyHeaderDetail HexRGBAlpha(0x4e6cef,1)
#define titleLightTitle HexRGBAlpha(0x747272,1)



//left delete 图标 ios 60px
//小图标 ios 40px
//最小图标 30px

//#f6f6f6

#define sizeWithText(text,attribute,maxSize) [text boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size


#define systemVersionGreaterOrEqualThan(version) ([[[UIDevice currentDevice] systemVersion] floatValue] >= version)


#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif


#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define NSLog(...)
#define debugMethod()
#endif


#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#endif /* Macros_h */
