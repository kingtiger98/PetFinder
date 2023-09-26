//
//  ViewController.swift
//  PetFinder
//
//  Created by 황재하 on 9/24/23.
//

import UIKit

class ViewController: UIViewController {

// 폰트
// family: EF_제주돌담
// name: EF_jejudoldam
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        label.text = "폰트 테스트"
        label.font = UIFont(name: "EF_jejudoldam", size: 15)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        
        Network.shared.requestConvertible(type: Pet.self, api: .petData(pageNo: "1", bgnde: "20230908", endde: "20230909", upkind: "417000", upr_cd: "6110000", neuter_yn: "Y")) { response in
            switch response {
            case .success(let success):
                dump(success)
            case .failure(let failure):
                print(failure)
            }
            
        }
        
    }


}

