//
//  RealmModel.swift
//  PetFinder
//
//  Created by 황재하 on 9/26/23.
//

import UIKit
import RealmSwift

final class FavoriteTable: Object {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var mallName: String
    @Persisted var title: String
    @Persisted var price: String
    @Persisted var image: String
    @Persisted var productId: String
    @Persisted var favorite: Bool

    
    convenience init(mallName: String, title: String, price: String, image: String, id: String) {
        self.init()
        self.mallName = mallName
        self.title = title
        self.price = price
        self.image = image
        self.productId = id
        self.favorite = true
    }

}
