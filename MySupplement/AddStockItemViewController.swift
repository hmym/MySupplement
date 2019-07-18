//
//  AddStockItemViewController.swift
//  MySupplement
//
//  Created by 濱山知香 on 2019/06/27.
//  Copyright © 2019 濱山知香. All rights reserved.
//

import UIKit
// realmswiftを追加しないとrealmが使えない
import RealmSwift

class AddStockItemViewController: UIViewController {
    
    // 戻るボタンを作る
    // delete機能をつける（UIを削除した時点でrealmのデータも削除）
    // 画像を保存できる機能をつける
    // tablecellをタップした時に詳細画面に遷移する
    // 在庫数を減らせる機能をつける（長押しするとダイアログ、マイナスボタンをつける？）
    
    @IBOutlet weak var inputAddStockItemName: UITextField!
    @IBOutlet weak var inputAddStockHowto: UITextField!
    @IBOutlet weak var inputAddStockNumber: UITextField!
    // 保存ボタンが押された時の処理
    @IBAction func addStockItemSaveTapped(_ sender: Any) {
        
        let name = inputAddStockItemName.text!
        let howto = inputAddStockHowto.text!
        let number = inputAddStockNumber.text!
        // image:カメラアプリから画像を持ってくる
        //let image = inputAddStockImage.image!
        
        //         オブジェクトを作成
        let item = StockSupplementItem();
        item.addStockItemName = name;
        item.addStockItemHowto = howto;
        item.addStockItemNumber = number;
        // item.addStockItemImage = image;
        
        // Realmのインスタンスを生成する
        let realm = try! Realm()
        
        // 書き込みトランザクション内でデータを追加する
        try! realm.write {
            realm.add(item)
        }
        //モーダルの画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var name = StockSupplementItem(name: "addStockItemName")
        
        // Do any additional setup after loading the view.
    }
   
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
