//
//  NetworkTool.swift
//  LOLX
//
//  Created by RocWang on 2017/8/21.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class NetworkTool {
    
    class func loadHomeTitlesData(fromViewController: String, completionHandler:@escaping (_ topTitles: [TopicTitle], _ homeTopicVCs: [TopicViewController])->()) {
        
        var titles = [TopicTitle]()
        var homeTopicVCs = [TopicViewController]()
        // 添加推荐标题
        let recommendDict = ["category": "", "name": "推荐"]
        let recommend = TopicTitle(dict: recommendDict as [String : AnyObject])
        titles.append(recommend)
        // 添加控制器
        let firstVC = TopicViewController()
        firstVC.topicTitle = recommend
        homeTopicVCs.append(firstVC)
        
        let data = [["category": "0", "name": "最新"],["category": "1", "name": "攻略"],["category": "2", "name": "赛事"]]
        for dict in data {
            let topicTitle = TopicTitle(dict: dict as [String: AnyObject])
            titles.append(topicTitle)
            let homeTopicVC = TopicViewController()
            homeTopicVC.topicTitle = topicTitle
            homeTopicVCs.append(homeTopicVC)
        }
        completionHandler(titles, homeTopicVCs)
        
    }
}
