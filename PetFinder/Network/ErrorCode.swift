//
//  ErrorCode.swift
//  PetFinder
//
//  Created by 황재하 on 9/24/23.
//

import Foundation
import Alamofire

enum SeSACError: Int, Error, LocalizedError {
    
    case APPLICATION_ERROR = 1
    case HTTP_ERROR = 4
    case NO_OPENAPI_SERVICE_ERROR = 12
    case SERVICE_ACCESS_DENIED_ERROR = 20
    case LIMITED_NUMBER_OF_SERVICE_REQUESTS_EXCEEDS_ERROR = 22
    case SERVICE_KEY_IS_NOT_REGISTERED_ERROR = 30
    case DEADLINE_HAS_EXPIRED_ERROR = 31
    case UNREGISTERED_IP_ERROR = 32
    case UNKNOWN_ERROR = 99

    
    var key: String{
        switch self {
        case .APPLICATION_ERROR:
            return "어플리케이션 에러"
        case .HTTP_ERROR:
            return "HTTP 에러"
        case .NO_OPENAPI_SERVICE_ERROR:
            return "해당 오픈API서비스가 없거나 폐기됨"
        case .SERVICE_ACCESS_DENIED_ERROR:
            return "서비스 접근거부"
        case .LIMITED_NUMBER_OF_SERVICE_REQUESTS_EXCEEDS_ERROR:
            return "서비스 요청제한횟수 초과에러"
        case .SERVICE_KEY_IS_NOT_REGISTERED_ERROR:
            return "등록되지 않은 서비스키"
        case .DEADLINE_HAS_EXPIRED_ERROR:
            return "활용기간 만료"
        case .UNREGISTERED_IP_ERROR:
            return "등록되지 않은 IP"
        case .UNKNOWN_ERROR:
            return "기타에러"
        }
    }
    
}
