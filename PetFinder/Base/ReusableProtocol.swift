//
//  ReusableProtocol.swift
//  PetFinder
//
//  Created by 황재하 on 9/26/23.
//

import UIKit

protocol ReusableProtocol{
    
    static var identifier: String { get }
    
}

extension UIViewController{
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell{
    static var identifier: String {
        return String(describing: self)
    }
}
