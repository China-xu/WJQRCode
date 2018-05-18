//
//  WJCommon.swift
//  WJQRCode
//
//  Created by 徐庆标 on 2018/5/18.
//  Copyright © 2018年 徐庆标. All rights reserved.
//

import UIKit

class WJCommon: NSObject {
    // MARK:- 打开系统设置
   static func canOpenSystemSetting() -> Bool {
        if #available(iOS 8.0, *) {
            let settingUrl = NSURL(string: UIApplicationOpenSettingsURLString)!
            if UIApplication.shared.canOpenURL(settingUrl as URL)
            {
                return true
            }else {
                return false
            }
        }
        return false
    }
    
}
