//
//  Font.swift
//  PetFinder
//
//  Created by 황재하 on 9/28/23.
//

import UIKit

enum Font{
    
    case title
    case label
    case button
    
    var key: UIFont{
        switch self {
        case .title:
            return UIFont(name: "EF_jejudoldam", size: 18.0)!
        case .label:
            return UIFont(name: "EF_jejudoldam", size: 14.0)!
        case .button:
            return UIFont(name: "EF_jejudoldam", size: 12.0)!
        }
    }
}
