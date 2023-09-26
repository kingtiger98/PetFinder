//
//  Network.swift
//  PetFinder
//
//  Created by 황재하 on 9/25/23.
//

import Foundation
import Alamofire

class Network{
    
    static let shared = Network()
    
    private init() {}
    
    // requestConvertible Router 사용
    func requestConvertible<T: Decodable>(type: T.Type ,api: Router, completionHandler: @escaping (Result<T, PetError>) -> Void){
        print(api)
        
        AF.request(api).responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    print("네트워킹 성공")
                    print(value)
                    completionHandler(.success(value))
                    
                case .failure(_):
                    let statusCode = response.response?.statusCode ?? 500
                    guard let error = PetError(rawValue: statusCode) else { return }
                    print("네트워킹 실패")
                    print(error)
                    completionHandler(.failure(error))
                }
            }
    }
    
    
    
}
