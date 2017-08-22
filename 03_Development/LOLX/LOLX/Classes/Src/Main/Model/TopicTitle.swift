//
//  TopicTitle.swift
//  LOLX
//
//  Created by RocWang on 2017/8/21.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

import Foundation

class TopicTitle {
    var category : String?
    var name:String?
    var type:String?
    
    init(dict:[String:AnyObject]){
        category = dict["category"] as? String
        name = dict["name"] as? String
        type = dict["type"] as? String
    }
}
