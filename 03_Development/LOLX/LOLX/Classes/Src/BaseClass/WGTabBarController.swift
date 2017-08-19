//
//  WGTabBarController.swift
//  LOLX
//
//  Created by V on 2017/8/13.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

import UIKit
import SwiftIconFont

class WGTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

//        let tabBar = UITabBar.appearance()
//        tabBar.tintColor = UIColor(red: 245 / 255, green: 90 / 255, blue: 93 / 255, alpha: 1/0)
        
        let mainViewController = WGMainViewController();
        mainViewController.tabBarItem = UITabBarItem.init();
        mainViewController.tabBarItem.icon(from: .FontAwesome, code: "home", iconColor: UIColor.blue, imageSize: CGSize(width: 20, height: 20), ofSize: 20);
        mainViewController.tabBarItem.title = "首页";
        let mainNavigationController = UINavigationController.init(rootViewController: mainViewController);
        
        let videoViewController = WGVideoViewController();
        videoViewController.tabBarItem = UITabBarItem.init();
        videoViewController.tabBarItem.icon(from: .FontAwesome, code: "camera", iconColor: UIColor.blue, imageSize: CGSize(width: 20, height: 20), ofSize: 20);
        videoViewController.tabBarItem.title = "视频";
        let videoNavigationController = UINavigationController.init(rootViewController: videoViewController);
        
        let discoverViewController = WGDiscoverViewController();
        discoverViewController.tabBarItem = UITabBarItem.init();
        discoverViewController.tabBarItem.icon(from: .FontAwesome, code: "search", iconColor: UIColor.blue, imageSize: CGSize(width: 20, height: 20), ofSize: 20);
        discoverViewController.tabBarItem.title = "发现";
        let discoverNavigationController = UINavigationController.init(rootViewController: discoverViewController);
        
        let profileViewController = WGProfileViewController();
        profileViewController.tabBarItem = UITabBarItem.init();
        profileViewController.tabBarItem.icon(from: .FontAwesome, code: "user", iconColor: UIColor.blue, imageSize: CGSize(width: 20, height: 20), ofSize: 20);
        profileViewController.tabBarItem.title = "我的";
        let profileNavigationController = UINavigationController.init(rootViewController: profileViewController);
        
        viewControllers = [mainNavigationController,
                           videoNavigationController,
                           discoverNavigationController,
                           profileNavigationController];
        
    }
}
