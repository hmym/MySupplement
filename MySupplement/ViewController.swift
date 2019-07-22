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
        return items.count
    }
    // テーブルの行ごとのセルを返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Storybordで指定したstockSupplementCell識別子を利用して再利用可能なセルを取得する
        let cell = stockSupplementList.dequeueReusableCell(withIdentifier: "stockSupplementCell") as! StockSupplementCell
        // セルのimageに商品画像をセット
        cell.supplementThumdnail.image = UIImage(named: items[indexPath.row].addStockItemImage)
        //  商品名にitemse[]のaddStockItemNameをセット
        cell.supplementName.text = items[indexPath.row].addStockItemName
        // 飲み方にitemse[]のaddStockItemHowtoをセット
        cell.supplementHowto.text = items[indexPath.row].addStockItemHowto
        // 在庫数にitemse[]のaddStockItemNumberをセット
        cell.supplementStockNumber.text = items[indexPath.row].addStockItemNumber
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if(editingStyle == UITableViewCell.EditingStyle.delete) {
            // Realm内のデータを削除
            do{
                let realm = try Realm()
                try realm.write {
                    realm.delete(items[indexPath.row])
                }
                // itemsはデータソースです。
                self.items.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            }catch{
            }
        }
    }

    // 画面を起動した時に一度だけ呼ばれる
    override func viewDidLoad() {
        super.viewDidLoad()
        stockSupplementList.delegate = self
        stockSupplementList.dataSource = self
        

    }
    
    // ライフサイクル　戻ってきた時に呼ばれる処理
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // realmのインスタンスを生成する
        let realm = try! Realm()
        // resultにStockSupplementItemクラスの値を代入
        let result = realm.objects(StockSupplementItem.self)
        // resultを配列に入れてitemsに代入
        items = Array(result)
        //tableViewを再描画する
        stockSupplementList.reloadData()
    }

}

