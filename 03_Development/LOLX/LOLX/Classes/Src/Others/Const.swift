//
//  Const.swift
//  LOLX
//
//  Created by RocWang on 2017/8/22.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//
import UIKit
import AdSupport

/// 屏幕的宽
let screenWidth = UIScreen.main.bounds.width
/// 屏幕的高
let screenHeight = UIScreen.main.bounds.height

/// 当前时间
let date = Date()
let currentTimeInterval = UInt64(date.timeIntervalSince1970 * 1000)

let resolution = "\(screenWidth * 2)*\(screenHeight * 2)"
/// idfv
let idfv = UIDevice.current.identifierForVendor?.uuidString
/// 版本号
let versionCode = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
/// 系统版本号
let systemVersion = UIDevice.current.systemVersion
/// idfa
let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
// 左右间距
let kMargin:CGFloat = 15.0
// 导航栏高度
let kNavBarHeight: CGFloat = 64.0
// 导航栏高度
let kTabBarHeight: CGFloat = 49.0
/// 首页新闻间距
let khomePageTitleHeight: CGFloat = 40.0
/// 首页新闻间距
let kHomeMargin: CGFloat = 15.0
/// 微头条界面 头部视图 的高度
let kWeiTouTiaoHeaderHieght: CGFloat = 45
/// 我的界面 头部视图 的高度
let kMineHeaderViewHieght: CGFloat = screenHeight * 0.38
/// 关注详情界面 头部视图 的高度
var kConcernHeaderViewHieght: CGFloat = 330


/// iPhone 5
let isIPhone5 = screenHeight == 568 ? true : false
/// iPhone 6
let isIPhone6 = screenHeight == 667 ? true : false
/// iPhone 6P
let isIPhone6P = screenHeight == 736 ? true : false






