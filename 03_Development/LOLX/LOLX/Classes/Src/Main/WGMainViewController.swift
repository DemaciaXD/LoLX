//
//  WGMainViewController.swift
//  LOLX
//
//  Created by V on 2017/8/14.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

import UIKit

class WGMainViewController: WGViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView :UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "首页";
        self.view.backgroundColor = UIColor.white
        self.tableView = UITableView(frame:UIScreen.main.bounds, style:UITableViewStyle.grouped)
        tableView?.dataSource = self
        tableView?.delegate = self
        

//        loadMyHeros("RocWang丶", "网通三");

        self.view.addSubview(tableView!)
        self.tableView?.register(UITableViewCell().classForCoder, forCellReuseIdentifier: "cell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int)->Int {
        return 30;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.textLabel!.text = "测试"
        return cell
    }
    
    fileprivate func showAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }
    
    func loadMyHeros(_ userName: String, _ serverName: String) {
        LolProvider.request(.myHeros(userName, serverName)) { result in
            do {
                self.showAlert("GitHub Fetch", message: result.description)
            }
        }
    }
}
