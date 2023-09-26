//
//  PetTableRepository.swift
//  PetFinder
//
//  Created by 황재하 on 9/26/23.
//

import UIKit
import RealmSwift
import Toast

final class FavoriteTableRepository{
    
    private let realm = try! Realm()
    
    // 스키마 버전 체크하기
    func checkSchemaVersion(view: UIView){
        
        do{
            let version = try schemaVersionAtURL(realm.configuration.fileURL!)
            print("Schema Version: \(version)")

        } catch {
            print(error)
            view.makeToast("Schema Version Error", duration: 3.0, position: .center)
        }
        
    }

    func fileURL() {
        print(realm.configuration.fileURL!)
    }
    
    // 값 가져오기 , 등록순으로 가져옴
    func fetch() -> Results<PetTable>{
        let data = realm.objects(PetTable.self)
        return data
    }
    
    // 값 추가하기
    func createItem(_ item: PetTable, view: UIView) {
        do {
            try realm.write {
                realm.add(item)
                print("Realm Add Succeed")
            }
            
        } catch {
            print(error)
            view.makeToast("Realm Add Error", duration: 3.0, position: .center)
        }
    }
    
    // 값 수정하기
    func updateItem(id: ObjectId, memo: String, view: UIView){
        do {
            try realm.write {
                // 1. 특정 레코드에 있는 모든 값을 수정 할 때 사용합니다.
                // realm.add(item, update: .modified)
                
                // 2. 특정 컬럼 값만 수정 할 때 사용합니다.
                realm.create(PetTable.self, value: ["_id": id, "memo":  memo], update: .modified)
            }
            
        } catch {
            print("error")
            view.makeToast("Realm Update Error", duration: 3.0, position: .center)
        }
    }
    
    // 값 삭제하기
    func deleteItem(_ item: PetTable, view: UIView){
        
        do {
            try realm.write {
                realm.delete(item)
            }
        } catch {
            print(error)
            view.makeToast("Realm Delete Error", duration: 3.0, position: .center)
        }
        

    }
    
    
}
