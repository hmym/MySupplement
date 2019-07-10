//
//  ViewController.swift
//  MySupplement
//
//  Created by 濱山知香 on 2019/06/27.
//  Copyright © 2019 濱山知香. All rights reserved.
//

import UIKit
import RealmSwift
//UITableViewDelegate, UITableViewDataSourceのプロトコルを実装する旨の宣言を行う
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // StockSupplementItemクラスをitemに代入
    let item = StockSupplementItem(addStockItemName: "ビタミンB", addStockItemHowto: "1時間１錠", addStockItemNumber: "3", addStockItemImage: "B-50")
    // StockSupplementItemクラスをitemCに代入
    let itemC = StockSupplementItem(addStockItemName: "ビタミンC", addStockItemHowto: "1日１錠", addStockItemNumber: "3", addStockItemImage: "C-1000")
    // StockSupplementItemクラスをitemEに代入
    let itemE = StockSupplementItem(addStockItemName: "ビタミンE", addStockItemHowto: "1日3錠", addStockItemNumber: "3", addStockItemImage: "E-1000")
    // itemesに空の配列を代入
    var items : Array<StockSupplementItem> = []
    
    // tableViewを関連付け
    @IBOutlet weak var stockSupplementList: UITableView!
    // addボタンをタップした時に呼ばれる処理
    @IBAction func addStockItem(_ sender: Any) {
        // Storybordで指定したaddStockItemをaddStockItemViewControllerに代入
        let addStockItemViewController = storyboard!.instantiateViewController(withIdentifier: "addStockItem")
        // モーダルでaddStockItemViewControllerが出現
        self.present(addStockItemViewController, animated: true, completion: nil)
    }
    // テーブルの行数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    // テーブルの行ごとのセルを返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Storybordで指定したstockSupplementCell識別子を利用して再利用可能なセルを取得する
        let cell = stockSupplementList.dequeueReusableCell(withIdentifier: "stockSupplementCell") as! StockSupplementCell
        // セルのimageに商品画像をセット
        cell.supplementThumdnail.image = UIImage(named: items[indexPath.row].addStockItemImage)
        // 商品名にitemse[]のaddStockItemNameをセット
        cell.supplementName.text = items[indexPath.row].addStockItemName
        // 飲み方にitemse[]のaddStockItemHowtoをセット
        cell.supplementHowto.text = items[indexPath.row].addStockItemHowto
        // 在庫数にitemse[]のaddStockItemNumberをセット
        cell.supplementStockNumber.text = items[indexPath.row].addStockItemNumber
    
        return cell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockSupplementList.delegate = self
        stockSupplementList.dataSource = self
        // realmを使うと宣言する
        let realm = try! Realm()
        // 配列itemsにitemを入れる
        items = [item, itemC, itemE]
    }


}

