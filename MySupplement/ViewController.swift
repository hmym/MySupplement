//
//  ViewController.swift
//  MySupplement
//
//  Created by 濱山知香 on 2019/06/27.
//  Copyright © 2019 濱山知香. All rights reserved.
//

import UIKit
//UITableViewDelegate, UITableViewDataSourceのプロトコルを実装する旨の宣言を行う
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // StockSupplementItemクラスをitemに代入
    let item = StockSupplementItem()
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
        cell.supplementThumdnail.image = UIImage(named: item.images[indexPath.row])
        // セルのラベルに商品タイトルをセット
        cell.supplementName.text = item.titles[indexPath.row]
    
        return cell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockSupplementList.delegate = self
        stockSupplementList.dataSource = self
        // Do any additional setup after loading the view.
    }


}

