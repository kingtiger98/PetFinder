//
//  TodayViewController.swift
//  PetFinder
//
//  Created by 황재하 on 9/26/23.
//

import UIKit
import SnapKit
import Kingfisher

class TodayViewController: BaseViewController{
    
    var list: Pet?
    
    lazy var todayCollectionView = UICollectionView(frame: .zero, collectionViewLayout: configurePinterestLayout())
    
    var dataSource: UICollectionViewDiffableDataSource<Int, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Network.shared.request(type: Pet.self, api: .recent(page: 1)) { response in
            switch response {
            case .success(let success):
                if let response = success.response?.body?.items?.item {
                    // 데이터 + UI 갱신 스냅샷
                    let ratios = response.map { Ratio(ratio:  $0.width / $0.height) }

                    let layout = PinterestLayout(columnsCount: 2, itemRatios: ratios, spacing: 10, contentWidth: self.view.frame.width)

                    self.todayCollectionView.collectionViewLayout = UICollectionViewCompositionalLayout(section: layout.section)
                    self.configureSnapshot(success)

                    dump(success)
                } else {
                    // response가 nil인 경우 처리
                    print("Response is nil")
                }
            case .failure(let failure):
                print(failure.localizedDescription) // 토스트로 대응하면 더 좋아
            }
        }

        
        view.backgroundColor = UIColor(named: "BackgroundColor")
        configuerCollectionView()
        configureDataSource()
    }
    
    override func configure() {
        view.addSubview(todayCollectionView)
        
    }
    
    override func setConstraints() {
        todayCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configuerCollectionView(){
        todayCollectionView.backgroundColor = .white
        todayCollectionView.showsVerticalScrollIndicator = false
        todayCollectionView.showsHorizontalScrollIndicator = false
        todayCollectionView.isScrollEnabled = true
        todayCollectionView.bounces = false
    }
    
    func configureDataSource(){
        
        let cellRegisteration = UICollectionView.CellRegistration<TodayCollectionViewCell ,Item>{ cell, indexPath, itemIdentifier in
            cell.imageView.kf.setImage(with: URL(string: (itemIdentifier.popfile)!))
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: todayCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: itemIdentifier)
            
        })
    }
    
    func configureSnapshot(_ item: Pet){
        var snapShot = NSDiffableDataSourceSnapshot<Int, Item>()
        
        snapShot.appendSections([0])
        
        if let items = item.response?.body?.items?.item {
            snapShot.appendItems(items, toSection: 0)
        }
        
        dataSource.apply(snapShot)
    }
    
    
    func configurePinterestLayout() -> UICollectionViewLayout{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .estimated(150))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(150))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.interGroupSpacing = 10
        
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .vertical
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        layout.configuration = configuration
        
        return layout
    }
    
}
