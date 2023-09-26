//
//  Router.swift
//  PetFinder
//
//  Created by 황재하 on 9/24/23.
//

import Foundation
import Alamofire

// http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=egIoKTYvPM9CAkBDsi%2BtZaPC777DJIE2Qf5FloixHUDVo7LMuX3sF%2BGWEU9XL2I2NcJ8YFasF%2FNKyb3fe6YO7Q%3D%3D

enum Router: URLRequestConvertible {
    
    case petData(
        pageNo: String,
        bgnde: String,
        endde: String,
        upkind: String,
        upr_cd: String,
        neuter_yn: String
    )
   
    
    // http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=egIoKTYvPM9CAkBDsi%2BtZaPC777DJIE2Qf5FloixHUDVo7LMuX3sF%2BGWEU9XL2I2NcJ8YFasF%2FNKyb3fe6YO7Q%3D%3D&numOfRows=20&_type=json &pageNo=2&upkind=417000&upr_cd&bgnde=20230606&endde=20230707&neuter_yn
    
    private var baseURL: URL{
        return URL(string: "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=\(APIKEY.key.rawValue)&numOfRows=20&_type=json")!
    }
    
    private var path: String{
        switch self {
        case .petData(let pageNo, let bgnde, let endde, let upkind, let upr_cd, let neuter_yn):
            return "&pageNo=\(pageNo)&upkind=\(upkind)&upr_cd=\(upr_cd)&bgnde=\(bgnde)&endde=\(endde)&neuter_yn=\(neuter_yn)"
        }
    }
    
    private var method: HTTPMethod {
        return .get
    }
    
    var query: [String : String]{
        switch self {
        case .petData(let pageNo, let bgnde, let endde, let upkind, let upr_cd, let neuter_yn):
            return [
                "pageNo":"\(pageNo)",
                "bgnde":"\(bgnde)",
                "endde":"\(endde)",
                "upkind":"\(upkind)",
                "upr_cd":"\(upr_cd)",
                "neuter_yn":"\(neuter_yn)",
            ]
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        
        let url = baseURL.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        
        request.method = method
        
        request = try URLEncodedFormParameterEncoder(destination: .methodDependent).encode(query, into: request)
        
        return request
        
    }
    
}
