import HandyJSON
enum HttpCode : Int {
    case success = 1 //请求成功的状态吗
    case needLogin = -1  // 返回需要登录的错误码
}

struct BaseModel: Codable {
    var resultCode: String
    var success: Bool
    var resultMessage: String

}


struct BasicTypes: HandyJSON {

    var resultCode: String?
    var success: Bool?
    var resultMessage: String?
    
}

class jsonModel: Codable {
    var resultCode: String?
    var success: Bool?
    var resultMessage: String?
    var result: Array<Content>?

}
class Content:  Codable{
    var fd_area_name: String?
    var fd_area_code: Int?
}

