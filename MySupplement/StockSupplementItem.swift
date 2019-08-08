//
//  StockSupplementItem.swift
//  MySupplement
//
//  Created by 濱山知香 on 2019/06/29.
//  Copyright © 2019 濱山知香. All rights reserved.
//
import Foundation
import RealmSwift

class StockSupplementItem: Object{
//    static let realm = try! Realm()
    
//    @objc dynamic private var id = 0
    @objc dynamic var addStockItemName : String = ""
    @objc dynamic var addStockItemHowto : String = ""
    @objc dynamic var addStockItemNumber : String = ""
    @objc dynamic var addStockItemImage : String = ""

//    dynamic var image: UIImage? {
//        set{
//            self.addStockItemImage = newValue
//            if let value = newValue {
//                self.imageData = value.pngData() as NSData?
//            }
//        }
//        get{
//            if let image = self.addStockItemImage {
//                return image
//            }
//            if let data = self.imageData {
//                self.addStockItemImage = UIImage(data: data as Data)
//                return self.addStockItemImage
//            }
//            return nil
//        }
//    }
//    dynamic private var imageData: NSData? = nil
//
//    override static func primaryKey() -> String? {
//        return "id"
//    }
//
//    override static func ignoredProperties() -> [String] {
//        return ["image", "_image"]
//    }
    
//    static func create() -> StockSupplementItem {
//        let item = StockSupplementItem()
//        item.id = lastId()
//        return item
//    }
    
//    static func loadAll() -> [StockSupplementItem] {
//        let items = realm.objects(StockSupplementItem()).sorted(byKeyPath: "id", ascending: false)
//        var ret: [StockSupplementItem] = []
//        for item in items {
//            ret.append(item)
//        }
//        return ret
//    }
    
//    static func lastId() -> Int {
//        if let item = realm.objects(StockSupplementItem()).last {
//            return item.id + 1
//        } else {
//            return 1
//        }
//    }
    
//    func save() {
//        try! StockSupplementItem.realm.write {
//            StockSupplementItem.realm.add(self)
//        }
//    }
}
