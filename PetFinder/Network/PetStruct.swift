//
//  PetStruct.swift
//  PetFinder
//
//  Created by 황재하 on 9/25/23.
//

import Foundation

// MARK: - Welcome
struct Pet: Codable, Hashable {
    let response: PetData?
}

// MARK: - Response
struct PetData: Codable, Hashable {
    let header: Header?
    let body: Body?
}

// MARK: - Body
struct Body: Codable, Hashable {
    let items: Items?
    let numOfRows, pageNo, totalCount: Int?
}

// MARK: - Items
struct Items: Codable, Hashable {
    let item: [Item]?
}

// MARK: - Item
struct Item: Codable, Hashable {
    let desertionNo: String?
    let filename: String?
    let happenDt, happenPlace, kindCD, colorCD: String?
    let age, weight: String?
    let noticeNo: String?
    let noticeSdt, noticeEdt: String?
    let popfile: String?
    let processState: String?
    let sexCD: String?
    let neuterYn: String?
    let specialMark, careNm, careTel, careAddr: String?
    let orgNm, chargeNm, officetel: String?
    
    let width: CGFloat = CGFloat.random(in: 50...150)
    let height: CGFloat = CGFloat.random(in: 100...150)
    
    
    enum CodingKeys: String, CodingKey {
        case desertionNo, filename, happenDt, happenPlace
        case kindCD = "kindCd"
        case colorCD = "colorCd"
        case age, weight, noticeNo, noticeSdt, noticeEdt, popfile, processState
        case sexCD = "sexCd"
        case neuterYn, specialMark, careNm, careTel, careAddr, orgNm, chargeNm, officetel
    }
}

// MARK: - Header
struct Header: Codable, Hashable {
    let reqNo: Int?
    let resultCode, resultMsg: String?
}
