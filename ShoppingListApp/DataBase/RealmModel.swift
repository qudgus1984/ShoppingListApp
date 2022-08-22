//
//  RealmModel.swift
//  ShoppingListApp
//
//  Created by 이병현 on 2022/08/22.
//

import Foundation
import RealmSwift

class UserShoppingList: Object {
    @Persisted var favorite: Bool //즐겨찾기(필수)
    @Persisted var checkBox: Bool //체크박스(필수)
    @Persisted var title: String //사야하는 물품(필수)
    
    @Persisted(primaryKey: true) var objectId: ObjectId

    convenience init(title: String) {
        self.init()
        self.favorite = false
        self.checkBox = false
        self.title = title
    }
}
