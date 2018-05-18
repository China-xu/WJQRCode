//
//  ViewController.swift
//  WJQRCode
//
//  Created by 徐庆标 on 2018/5/17.
//  Copyright © 2018年 徐庆标. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: (UIScreen.main.bounds.size.width-100) * 0.5, y: (UIScreen.main.bounds.size.height-30) * 0.5, width: 100, height: 30))
        button.setTitle("扫一扫", for: UIControlState())
        button.setTitleColor(UIColor.blue, for: UIControlState())
        button.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
    }
    
    
    
    @objc func buttonAction(_ sender : AnyObject){
        
        let authStatus:AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            
            if(authStatus == AVAuthorizationStatus.denied || authStatus == AVAuthorizationStatus.restricted) {
                let alertController = UIAlertController.init(title: "相机权限受限", message: "请在iPhone的\"设置->隐私->相机\"选项中,允许\"原Me\"访问您的相机.", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "好", style: .cancel) { (_) in }
                let cancelAction = UIAlertAction.init(title: "去设置", style: .default, handler: { alertAction in
                    if WJCommon.canOpenSystemSetting() {
                        let settingUrl = NSURL(string: UIApplicationOpenSettingsURLString)!
                        if UIApplication.shared.canOpenURL(settingUrl as URL) {
                            UIApplication.shared.openURL(settingUrl as URL) } } })
                alertController.addAction(confirmAction)
                alertController.addAction(cancelAction)
                self.present(alertController, animated: true, completion: nil)
            }else if(authStatus == AVAuthorizationStatus.authorized){
                let  scanner = WJQRcode()
                self.navigationController?.pushViewController(scanner, animated: true)
            }else if(authStatus == AVAuthorizationStatus.notDetermined){
                AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted:Bool) in
                    if (granted) {
                        DispatchQueue.main.async {
                            let  scanner = WJQRcode()
                            self.navigationController?.pushViewController(scanner, animated: true) }}else { } })
                
            }else {
                let  scanner = WJQRcode()
                self.navigationController?.pushViewController(scanner, animated: true)}}
   
}

