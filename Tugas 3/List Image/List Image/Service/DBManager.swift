//
//  DBManager.swift
//  List Image
//
//  Created by Rangga Senatama Putra on 18/09/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class DBManager {
    private var database:Realm
    static let sharedInstance = DBManager()
    private init() {
        database = try! Realm()
    }
    func getDataFromDB() ->   Results<Item> {
        let results: Results<Item> =   database.objects(Item.self)
        return results
    }
    func addData(object: Item)   {
        try! database.write {
            database.add(object, update: true)
            print("Added new object")
        }
    }
    func deleteAllFromDatabase()  {
        try!   database.write {
            database.deleteAll()
        }
    }
    func deleteFromDb(object: Item)   {
        try!   database.write {
            database.delete(object)
        }
    }
}
