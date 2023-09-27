//
//  Network.swift
//  PetFinder
//
//  Created by 황재하 on 9/25/23.
//

import Foundation
import Alamofire
import Toast

class Network{
    
    static let shared = Network()
    
    private init() {}
    
    // requestConvertible Router 사용 _ 오류나서 일단 보류
    func requestConvertible<T: Decodable>(type: T.Type ,api: Router, completionHandler: @escaping (Result<T, PetError>) -> Void){
        
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
    
    // 제네릭으로 개선해보즈아 ~> , "재하" <- String <- String.Type
    func request<T: Decodable>(type: T.Type ,api: APIManagerPet, completionHandler: @escaping (Result<T, PetError>) -> Void){
        
        AF.request(api.endPoint, method: api.method, parameters: api.query, encoding: URLEncoding(destination: .queryString))
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completionHandler(.success(value))
                    
                case .failure(_):
                    let statusCode = response.response?.statusCode ?? 500
                    guard let error = PetError(rawValue: statusCode) else { return }
                    completionHandler(.failure(error))
                    
                }
            }
    }
    
    
    
    
    
}
