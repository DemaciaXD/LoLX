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

        let tabBar = UITabBar.appearance()
        tabBar.tintColor = UIColor(red: 245 / 255, green: 90 / 255, blue: 93 / 255, alpha: 1/0)
        
        let mainViewController = WGMainViewController();
        mainViewController.tabBarItem = UITabBarItem.init(title: "首页", image: UIImage.init(named: "home_tabbar_32x32_"), selectedImage: UIImage.init(named: "home_tabbar_press_32x32_"));
        let mainNavigationController = UINavigationController.init(rootViewController: mainViewController);
        
        
        
        let videoViewController = WGProfileViewController();
        videoViewController.tabBarItem = UITabBarItem.init();
        videoViewController.tabBarItem.icon(from: .FontAwesome, code: "twitter", iconColor: UIColor.blue, imageSize: CGSizeFromString("20"), ofSize: 20)
        let videoNavigationController = UINavigationController.init(rootViewController: videoViewController);
        
        
        
        let discoverViewController = WGDiscoverViewController();
        discoverViewController.tabBarItem = UITabBarItem.init(title: "我的", image: UIImage.init(named: "mine_tabbar_32x32_"), selectedImage: UIImage.init(named: "mine_tabbar_press_32x32_"));
        let discoverNavigationController = UINavigationController.init(rootViewController: discoverViewController);

        let profileViewController = WGProfileViewController();
        profileViewController.tabBarItem = UITabBarItem.init(title: "我的", image: UIImage.init(named: "mine_tabbar_32x32_"), selectedImage: UIImage.init(named: "mine_tabbar_press_32x32_"));
        let profileNavigationController = UINavigationController.init(rootViewController: profileViewController);

        
        viewControllers = [mainNavigationController,videoNavigationController,discoverNavigationController,profileNavigationController];
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
