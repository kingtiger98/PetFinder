//
//  ViewController.swift
//  PetFinder
//
//  Created by 황재하 on 9/24/23.
//

import UIKit
import Alamofire

class MainViewController: BaseViewController {

// 폰트
// family: EF_제주돌담
// name: EF_jejudoldam
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "BackgroundColor")

        // 잘됨
//        Network.shared.request(type: Pet.self, api: .recent(page: 2)) { response in
//            switch response {
//            case .success(let success):
//                dump(success)
//            case .failure(let failure):
//                print(failure.errorDescription!)
//            }
//        }
        
       
        Network.shared.request(type: Pet.self, api: .conditional(page: 1, kind: "417000", neuter: "Y", city: Region.seoul.code, bgnde: "20220101", endde: "20220102")) { response in
            switch response {
            case .success(let success):
                dump(success)
            case .failure(let failure):
                print(failure.errorDescription!)
            }
        }
    
        }
        
    }




