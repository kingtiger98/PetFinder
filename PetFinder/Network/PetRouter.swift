//
//  Router.swift
//  PetFinder
//
//  Created by 황재하 on 9/24/23.
//

import Foundation
import Alamofire

// 일단 보류중
enum Router: URLRequestConvertible {
    
    case petData(
        pageNo: String,
        bgnde: String,
        endde: String,
        upkind: String,
        upr_cd: String,
        neuter_yn: String
    )
    
    private var baseURL: URL{
        return URL(string: "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=\(APIKEY.key.rawValue)&numOfRows=30&_type=json")!
    }
    
    // 여기서 부터 문제야
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
        print(baseURL)
        let url = baseURL.appendingPathComponent(path)
        print(url)
        var request = URLRequest(url: url)
        print(request)
        request.method = method
        
        request = try URLEncodedFormParameterEncoder(destination: .methodDependent).encode(query, into: request)
        
        return request
        
    }
    
}
