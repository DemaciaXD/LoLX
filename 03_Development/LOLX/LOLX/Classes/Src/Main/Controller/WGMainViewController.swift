//
//  WGMainViewController.swift
//  LOLX
//
//  Created by V on 2017/8/14.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

import UIKit
import SnapKit

class WGMainViewController: WGViewController {

    var tableView :UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        title = "LoLX"
        // 设置状态栏属性
        navigationController?.navigationBar.barStyle = .black
        
        automaticallyAdjustsScrollViewInsets = false
        
        /// 获取标题数据
        NetworkTool.loadHomeTitlesData(fromViewController: String(describing: WGMainViewController.self)) { (topTitles, homeTopicVCs) in
            // 将所有子控制器添加到父控制器中
            for childVc in homeTopicVCs {
                self.addChildViewController(childVc)
            }
            self.setupUI()

            self.pageView.titles = topTitles
            self.pageView.childVcs = self.childViewControllers as? [TopicViewController]
        }
        
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
    
    fileprivate lazy var pageView: HomePageView = {
        let pageView = HomePageView()
        return pageView
    }()
    
}

extension WGMainViewController {
    fileprivate func setupUI(){
        view.addSubview(pageView)
        
        pageView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.top.equalTo(view).offset(kNavBarHeight)
        }

    }
}
