//
//  RealmModel.swift
//  PetFinder
//
//  Created by 황재하 on 9/26/23.
//

import UIKit
import RealmSwift

final class PetTable: Object {
    
    @Persisted(primaryKey: true) var desertionNo: String
    @Persisted var kind: String
    @Persisted var sex: String
    @Persisted var age: String
    @Persisted var happenPlace: String
    @Persisted var careNm: String
    @Persisted var noticeSdt: String
    @Persisted var noticeEdt: String
    @Persisted var alertDt: String
    @Persisted var image: String

    convenience init(desertionNo: String, kind: String, sex: String, age: String, happenPlace: String, careNm: String, noticeSdt: String, noticeEdt: String, alertDt: String, image: String) {
        self.init()
        self.desertionNo = desertionNo
        self.kind = kind
        self.sex = sex
        self.age = age
        self.happenPlace = happenPlace
        self.careNm = careNm
        self.noticeSdt = noticeSdt
        self.noticeEdt = noticeEdt
        self.alertDt = alertDt
        self.image = image
    }

    
}
