//
//  WGHomeNavigationBar.swift
//  LOLX
//
//  Created by V on 2017/8/20.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

import UIKit

class WGHomeNavigationBar: UIView {
    class func homeNavigationBar() -> WGHomeNavigationBar {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.first as! WGHomeNavigationBar
    }
}
