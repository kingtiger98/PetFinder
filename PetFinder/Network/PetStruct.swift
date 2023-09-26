//
//  PetStruct.swift
//  PetFinder
//
//  Created by 황재하 on 9/25/23.
//

import Foundation


// MARK: - Welcome
struct Pet: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let header: Header
    let body: Body
}

// MARK: - Body
struct Body: Codable {
    let items: Items
    let numOfRows, pageNo, totalCount: Int
}

// MARK: - Items
struct Items: Codable {
    let item: [Item]
}

// MARK: - Item
struct Item: Codable {
    let desertionNo: String
    let filename: String
    let happenDt: String
    let happenPlace: HappenPlace
    let kindCD: KindCD
    let colorCD, age, weight, noticeNo: String
    let noticeSdt, noticeEdt: String
    let popfile: String
    let processState: ProcessState
    let sexCD: SexCD
    let neuterYn: NeuterYn
    let specialMark: SpecialMark
    let careNm: CareNm
    let careTel: CareTel
    let careAddr: CareAddr
    let orgNm: OrgNm
    let chargeNm: ChargeNm
    let officetel: Officetel

    enum CodingKeys: String, CodingKey {
        case desertionNo, filename, happenDt, happenPlace
        case kindCD = "kindCd"
        case colorCD = "colorCd"
        case age, weight, noticeNo, noticeSdt, noticeEdt, popfile, processState
        case sexCD = "sexCd"
        case neuterYn, specialMark, careNm, careTel, careAddr, orgNm, chargeNm, officetel
    }
}

enum CareAddr: String, Codable {
    case 전라북도완주군용진읍순지2길1876 = "전라북도 완주군 용진읍 순지2길 187-6  "
}

enum CareNm: String, Codable {
    case 완주군유기동물보호소 = "완주군유기동물보호소"
}

enum CareTel: String, Codable {
    case the0632903220 = "063-290-3220"
}

enum ChargeNm: String, Codable {
    case 나상운 = "나상운"
}

enum HappenPlace: String, Codable {
    case 용진읍불법도살장 = "용진읍 불법도살장"
}

enum KindCD: String, Codable {
    case 개도사믹스견 = "[개] 도사 믹스견"
    case 개믹스견 = "[개] 믹스견"
    case 개셰퍼드 = "[개] 셰퍼드"
}

enum NeuterYn: String, Codable {
    case n = "N"
}

enum Officetel: String, Codable {
    case the0632903248 = "063-290-3248"
}

enum OrgNm: String, Codable {
    case 전라북도완주군 = "전라북도 완주군"
}

enum ProcessState: String, Codable {
    case 보호중 = "보호중"
    case 종료기증 = "종료(기증)"
    case 종료안락사 = "종료(안락사)"
}

enum SexCD: String, Codable {
    case f = "F"
    case m = "M"
}

enum SpecialMark: String, Codable {
    case 등상처 = "등 상처"
    case 리트리버믹스 = "리트리버 믹스"
    case 없음 = "없음"
    case 점박이 = "점박이"
}

// MARK: - Header
struct Header: Codable {
    let reqNo: Int
    let resultCode, resultMsg: String
}
