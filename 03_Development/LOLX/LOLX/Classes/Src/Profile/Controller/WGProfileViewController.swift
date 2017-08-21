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
let kHeaderViewHeight = CGFloat(175)
let kStatusBarHeight = CGFloat(20)
let kNavigationBarHeight = CGFloat(44)

class WGProfileViewController: WGViewController, UITableViewDelegate, UITableViewDataSource {
    
    var headerContentView: UIView!
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "我的"
        view.backgroundColor = UIColor.white
        
        setupUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        tableView.tableHeaderView = tableViewHeaderView;
        view.addSubview(tableView)
        
        view.addSubview(customNavigationBarView)
    }
    
    fileprivate lazy var customNavigationBarView: WGHomeNavigationBar = {
        let navigationBar = WGHomeNavigationBar.homeNavigationBar()
        navigationBar.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 64)
        return navigationBar
    }()
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0,
                                                  y: -kStatusBarHeight,
                                                  width: kScreenWidth,
                                                  height: kScreenHeight + kNavigationBarHeight + kStatusBarHeight),
                                    style: .plain)
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = WGProfileSectionHeaderView.sectionHeaderView()
        return sectionHeaderView
    }
}

extension WGProfileViewController {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

extension WGProfileViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < -kStatusBarHeight {
            let addTopHeight = -offsetY - kStatusBarHeight;
            let scale = (kHeaderViewHeight + addTopHeight) / kHeaderViewHeight
            let currentImageViewWidth = kScreenWidth * scale
            let currentImageViewX = -kScreenWidth * (scale - 1) / 2.0
            self.headerContentView.frame = CGRect(x: 0,
                                                  y: offsetY + kStatusBarHeight,
                                                  width: kScreenWidth,
                                                  height: kHeaderViewHeight + addTopHeight)
            self.imageView.frame = CGRect(x: currentImageViewX,
                                          y: 0,
                                          width: currentImageViewWidth,
                                          height: kHeaderViewHeight + addTopHeight)
        }

    }
}
