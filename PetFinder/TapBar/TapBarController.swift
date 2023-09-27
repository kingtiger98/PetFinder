//
//  TapBarController.swift
//  PetFinder
//
//  Created by 황재하 on 9/26/23.
//

import UIKit

class TapBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarItem()
                
    }
    
    func setTabBarItem(){
        // 첫 번째 뷰 컨트롤러 생성 및 래핑
        let firstViewController = MainViewController()
        let firstNavigationController = UINavigationController(rootViewController: firstViewController)
        firstViewController.title = "Pet Finder"
        
        // 두 번째 뷰 컨트롤러 생성 및 래핑
        let secondViewController = TodayViewController()
        let thirdNavigationController = UINavigationController(rootViewController: secondViewController)
        secondViewController.title = "Today Pet"
        
        // 두 번째 뷰 컨트롤러 생성 및 래핑
        let thirdViewController = FavoriteViewController()
        let secondNavigationController = UINavigationController(rootViewController: thirdViewController)
        thirdViewController.title = "Favorite"
        
        configureTabBarItem(title: "동물찾기", image: "pawprint.circle.fill", nav: firstNavigationController)
        configureTabBarItem(title: "즐겨찾기", image: "heart.fill", nav: secondNavigationController)
        configureTabBarItem(title: "최근공고", image: "checkerboard.rectangle", nav: thirdNavigationController)
        
        // 탭 바 아이템 선택된 상태의 아이콘 및 텍스트 색상 변경
        tabBar.tintColor = UIColor(named: "Title")! // 원하는 아이콘 및 텍스트 색상으로 변경
        
        // 탭 바의 투명도 비활성화
        tabBar.isTranslucent = true

        // 탭 바 컨트롤러에 네비게이션 컨트롤러 추가
        viewControllers = [firstNavigationController, thirdNavigationController, secondNavigationController]
    }
    
    
    func configureTabBarItem(title: String, image: String, nav: UINavigationController){
                    
        let tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: image), tag: 0)

        // 선택되지 않은 상태의 텍스트 색상을 설정합니다.
        tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor(named: "Title")!], for: .normal)
        
        // 선택된 상태의 텍스트 색상을 설정합니다.
        tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor(named: "Title")!], for: .selected)
        
        // UITabBarController에 tabBarItem을 할당합니다.
        nav.tabBarItem = tabBarItem

        // titleTextAttributes 속성을 사용하여 폰트를 설정합니다.
        tabBarItem.setTitleTextAttributes([.font: Font.button.key], for: .normal)
        
        // 네비게이션 바 타이틀에 폰트를 적용합니다.
        nav.navigationBar.titleTextAttributes = [.font: Font.title.key, .foregroundColor: UIColor(named: "Title")!]
        
    }

    
}
