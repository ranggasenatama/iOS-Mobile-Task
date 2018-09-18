//
//  MyItem.swift
//  List Image
//
//  Created by Rangga Senatama Putra on 18/09/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var ID = 0
    @objc dynamic var textString = ""
    override static func primaryKey() -> String? {
        return "ID"
    }
}
