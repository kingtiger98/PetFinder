//
//  APIManagerPet.swift
//  PetFinder
//
//  Created by 황재하 on 9/28/23.
//

import Foundation
import Alamofire

enum APIManagerPet {
        
    case recent(page: Int)
    //case conditional(page: Int, kind: String, neuter: String, city: String, bgnde: String, endde: String)
    case conditional(page: Int, kind: String, neuter: String, city: String, bgnde: String, endde: String)

    private var baseURL: String{
        return "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=\(APIKEY.key.rawValue)&numOfRows=30&_type=json"
    }
    
    var endPoint: URL{
        switch self {
        case .recent(let page):
            return URL(string: baseURL + "&pageNo=\(page)")!
        case .conditional(let page, let kind, let neuter, let city, let bgnde, let endde):
            return URL(string: baseURL + "&pageNo=\(page)&upkind=\(kind)&neuter_yn=\(neuter)&upr_cd=\(city)&bgnde=\(bgnde)&endde=\(endde)")!
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var query: [String : String] {
        switch self {
        case .recent:
            return ["":""]
        case .conditional:
            return ["":""]
        }
    }

}
