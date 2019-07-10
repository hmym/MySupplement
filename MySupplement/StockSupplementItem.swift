//
//  StockSupplementItem.swift
//  MySupplement
//
//  Created by 濱山知香 on 2019/06/29.
//  Copyright © 2019 濱山知香. All rights reserved.
//

import Foundation

class StockSupplementItem {

    var addStockItemName : String = ""
    var addStockItemHowto : String = ""
    var addStockItemNumber : String = ""
    var addStockItemImage : String = ""
    init(addStockItemName : String, addStockItemHowto : String,
         addStockItemNumber : String, addStockItemImage : String) {
        self.addStockItemName = addStockItemName
        self.addStockItemHowto = addStockItemHowto
        self.addStockItemNumber = addStockItemNumber
        self.addStockItemImage = addStockItemImage
    }
}
