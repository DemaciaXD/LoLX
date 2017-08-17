//
//  WGMainViewController.swift
//  LOLX
//
//  Created by V on 2017/8/14.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

import UIKit

class WGMainViewController: WGViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "首页";
        
        loadMyHeros("RocWang丶", "网通三");
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
            } catch {
                self.showAlert("GitHub Fetch", message: "faile")
            }
        }
    }
}
