//
//  ViewController.swift
//  MySupplement
//
//  Created by 濱山知香 on 2019/06/27.
//  Copyright © 2019 濱山知香. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var stockSupplementList: UITableView!

    @IBAction func addStockItem(_ sender: Any) {
        let addStockItemViewController = storyboard!.instantiateViewController(withIdentifier: "addStockItem")
        self.present(addStockItemViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = stockSupplementList.dequeueReusableCell(withIdentifier: "stockSupplementCell") as! StockSupplementCell
        cell.supplementThumdnail.image = UIImage(named: "ship")
        cell.supplementName.text = "ビタミンA"
        
        return cell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockSupplementList.delegate = self
        stockSupplementList.dataSource = self
        // Do any additional setup after loading the view.
    }


}

