//
//  WGProfileViewController.swift
//  LOLX
//
//  Created by V on 2017/8/14.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height
let kHeaderViewHeight = CGFloat(200)
let kStatusBarHeight = CGFloat(20)
let kNavigationBarHeight = CGFloat(44)

class WGProfileViewController: WGViewController, UITableViewDelegate, UITableViewDataSource {
    
    var customNavigationBarView: UIView!
    var headerContentView: UIView!
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "我的"
        view.backgroundColor = UIColor.white
        
        setupUI()
    }
    
    fileprivate func setupUI() {
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        tableView.tableHeaderView = tableViewHeaderView;
        view.addSubview(tableView)
    }
    
    fileprivate lazy var customNavigationBarView = {
        let navigationBar = UIView
    }()
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0,
                                                  y: -64,
                                                  width: kScreenWidth,
                                                  height: kScreenHeight + kNavigationBarHeight + kStatusBarHeight),
                                    style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    fileprivate lazy var tableViewHeaderView: UIView = {
        let headerViewFrame = CGRect(x: 0, 
                                     y: 0,
                                     width: kScreenWidth,
                                     height: kHeaderViewHeight)
        let headerView = UIView.init(frame: headerViewFrame)
        
        self.headerContentView = UIView.init(frame: headerViewFrame)
        headerView.addSubview(self.headerContentView)
        
        self.imageView = UIImageView(image: UIImage(named: "personal_info_back_ground"))
        self.imageView.center = headerView.center
        self.imageView.frame = headerViewFrame
        self.headerContentView.addSubview(self.imageView)
        
        return headerView;
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension WGProfileViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "LOL vim"
        return cell
    }
}

extension WGProfileViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < -64 {
            let addTopHeight = -offsetY - 64;
            let scale = (kHeaderViewHeight + addTopHeight) / kHeaderViewHeight
            let currentImageViewWidth = kScreenWidth * scale
            let currentImageViewX = -kScreenWidth * (scale - 1) / 2.0
            self.headerContentView.frame = CGRect(x: 0,
                                                  y: offsetY + kStatusBarHeight + kNavigationBarHeight,
                                                  width: kScreenWidth,
                                                  height: kHeaderViewHeight + addTopHeight)
            self.imageView.frame = CGRect(x: currentImageViewX, y: 0, width: currentImageViewWidth, height: kHeaderViewHeight + addTopHeight)
        }

    }
}
