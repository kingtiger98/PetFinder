//
//  RegionCode.swift
//  PetFinder
//
//  Created by 황재하 on 9/25/23.
//

import Foundation

enum Region: String {
    case seoul = "서울특별시"
    case busan = "부산광역시"
    case daegu = "대구광역시"
    case incheon = "인천광역시"
    case gwangju = "광주광역시"
    case sejong = "세종특별자치시"
    case daejeon = "대전광역시"
    case ulsan = "울산광역시"
    case gyeonggi = "경기도"
    case gangwon = "강원특별자치도"
    case chungcheongNorth = "충청북도"
    case chungcheongSouth = "충청남도"
    case jeollaNorth = "전라북도"
    case jeollaSouth = "전라남도"
    case gyeongsangNorth = "경상북도"
    case gyeongsangSouth = "경상남도"
    case jeju = "제주특별자치도"

    var code: String {
        switch self {
        case .seoul: return "6110000"
        case .busan: return "6260000"
        case .daegu: return "6270000"
        case .incheon: return "6280000"
        case .gwangju: return "6290000"
        case .sejong: return "5690000"
        case .daejeon: return "6300000"
        case .ulsan: return "6310000"
        case .gyeonggi: return "6410000"
        case .gangwon: return "6530000"
        case .chungcheongNorth: return "6430000"
        case .chungcheongSouth: return "6440000"
        case .jeollaNorth: return "6450000"
        case .jeollaSouth: return "6460000"
        case .gyeongsangNorth: return "6470000"
        case .gyeongsangSouth: return "6480000"
        case .jeju: return "6500000"
        }
    }
}

