//
//  AddStockItemViewController.swift
//  MySupplement
//
//  Created by 濱山知香 on 2019/06/27.
//  Copyright © 2019 濱山知香. All rights reserved.
//

// 戻るボタンを作る
// delete機能をつける（UIを削除した時点でrealmのデータも削除）
// 画像を保存できる機能をつける
// tablecellをタップした時に詳細画面に遷移する
// 在庫数を減らせる機能をつける（長押しするとダイアログ、マイナスボタンをつける？）

import UIKit
// realmswiftを追加しないとrealmが使えない
import RealmSwift
import AssetsLibrary

class AddStockItemViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Cancelボタンが押された時の処理
//    @IBAction func cancelAddStock(_ sender: Any) {
        // 一つ前の画面に戻る
//        self.dismiss(animated: true, completion: nil)
//    }
    // 写真を選択するボタンを押した時の処理
//    @IBAction func inputAddStockPhotoImage(_ sender: Any) {
        // アルバム起動！
//        let album = UIImagePickerController.SourceType.photoLibrary
//        if UIImagePickerController.isSourceTypeAvailable(album) {
//            let album = UIImagePickerController()
//            album.delegate = self
//            album.sourceType = UIImagePickerController.SourceType.photoLibrary
//            album.allowsEditing = true
//            self.present(album, animated: true, completion: nil)
//        }
//    }
    // カメラボタンがタップされたときに実行される処理
    @IBAction func cameraButtonAction(_ sender: Any) {
        // カメラかフォトライブラリーどちらから画像を取得するか選択
        let alertController = UIAlertController(title: "確認", message: "選択してください", preferredStyle: .actionSheet)
        
        // カメラが利用可能かどうかチェックする
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // カメラを起動するための選択肢を定義
            let cameraAction = UIAlertAction(title: "カメラ", style: .default, handler: { (action:UIAlertAction) in
                // カメラを起動
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .camera
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        // フォトライブラリーが利用可能かどうかチェックする
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // フォトライブラリーを起動するための選択肢を定義
            let photoLibralyAction = UIAlertAction(title: "フォトライブラリー", style: .default, handler: { (action:UIAlertAction) in
                // フォトライブラリーを起動
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .photoLibrary
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            })
            alertController.addAction(photoLibralyAction)
        }
        
        // キャンセルの選択肢を定義
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        // iPadで落ちてしまう対策
        alertController.popoverPresentationController?.sourceView = view
        // 選択肢を画面に表示
        present(alertController, animated: true, completion: nil)
    }
    
    // 撮影が終わった時に呼ばれるdelegateメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 撮影した写真を、配置したpictureImageに渡す
        inputAddStockImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        // モーダルビューを閉じる
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var inputAddStockImage: UIImageView!
    @IBOutlet weak var inputAddStockItemName: UITextField!
    @IBOutlet weak var inputAddStockHowto: UITextField!
    @IBOutlet weak var inputAddStockNumber: UITextField!
    // 保存ボタンが押された時の処理
    @IBAction func addStockItemSaveTapped(_ sender: Any) {
        
        let name = inputAddStockItemName.text!
        let howto = inputAddStockHowto.text!
        let number = inputAddStockNumber.text!
        // image:カメラアプリから画像を持ってくる
//        let image = inputAddStockPhotoImage.UIImage!
        
        //         オブジェクトを作成
        let item = StockSupplementItem();
        item.addStockItemName = name;
        item.addStockItemHowto = howto;
        item.addStockItemNumber = number;
//        item.inputAddStockPhotoImage = image;
        
        // Realmのインスタンスを生成する
        let realm = try! Realm()
        
        // 書き込みトランザクション内でデータを追加する
        try! realm.write {
            realm.add(item)
        }
        //モーダルの画面を閉じる
//        self.dismiss(animated: true, completion: nil)
        // NavigationBarを閉じる
        self.navigationController?.popViewController(animated: true)
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
