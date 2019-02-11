//
//  HZNetwork.swift
//  HZUIDemo
//
//  Created by 何泽的mac on 2019/2/11.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON
import ObjectMapper
import MBProgressHUD
import Result

fileprivate struct Metric{
    static let delay:TimeInterval = 2
    ///网络请求超时时间
    static let networkTimeOut:TimeInterval = 30
}

struct HZNetwork {
    static var provider = MoyaProvider<MultiTarget>(requestClosure: requestTimeoutClosure)
    //弹出吐丝
    fileprivate static func toastMsg(_ title:String,_ msg:String? = nil){
        if QMUIAlertController.isAnyAlertControllerVisible(){
            return
        }
        var alert:QMUIAlertController!
        if let message = msg {
            alert = QMUIAlertController(title: title, message: message, preferredStyle: .alert)
        } else {
            alert = QMUIAlertController(title: "", message: title, preferredStyle: .alert)
        }
        
        let action = QMUIAlertAction(title: "确定", style: .cancel) { (controller, action)  in
            
        }
        alert.addAction(action)
        alert.showWith(animated: true)
    }
    //跳转到登录
    fileprivate static func tipsToLogin(_ errorCode: Int){
        if !QMUIAlertController.isAnyAlertControllerVisible(){
            
        }
    }
    
    ///检测网络是否正常
    fileprivate static func isNetConnect() -> Bool {
        let reachability:Reachability = Reachability()!
        if !reachability.isReachableViaWiFi && !reachability.isReachableViaWWAN {
            QMUITips.showError("加载失败，请检查网络情况", in: (UIViewController.current()?.view)!, hideAfterDelay: Metric.delay)
            return false
        } else {
            return true
        }
    }
    
    static func request(
        target:MultiTarget,
        success successCallback: @escaping (JSON) -> Void,
        err errorCallback: @escaping (_ errMsg: String) -> Void,
        showHud:UIView?,_ showSuccess:Bool? = false,_ showError:Bool? = true){
        
        guard isNetConnect() else {
            errorCallback("网络错误")
            return
        }
        var hud:MBProgressHUD?
        if let view = showHud {
            hud = MBProgressHUD.showAdded(to: view, animated: true)
            hud?.animationType = .fade
            hud?.label.text = "正在加载"
            hud?.mode = .indeterminate
            hud?.show(animated: true)
        }
        
        let _ = provider.rx.request(target)
            .filterSuccessfulStatusCodes()
            .retry(1).subscribe(onSuccess: { (response) in
            HZLog("url:\n\(target.baseURL.absoluteString + target.path)")
            HZLog("param:\n\( String(describing: target.task ) )")
                do {
                    let json = try JSON(response.mapJSON())
                    HZLog("json:\(json)")
//                    if let statuses = (json["statuses"].arrayValue) {
//                        
//                    }
                    successCallback(json)
                }
                catch _ {
                    errorCallback("网络异常")
                    if let h = hud {
                        let image = UIImage(named: "errors.png")?.withRenderingMode(.alwaysTemplate)
                        h.mode = .customView
                        h.customView = UIImageView(image: image)
                        h.label.text = "网络异常"
                    }else{
                        toastMsg("网络异常")
                    }
                }
                if let h = hud {
                    h.hide(animated: true, afterDelay: Metric.delay)
                }
            
        }) { (error) in
            errorCallback(error.localizedDescription)
            if let h = hud {
                let image = UIImage(named: "errors.png")?.withRenderingMode(.alwaysTemplate)
                h.mode = .customView
                h.customView = UIImageView(image: image)
                h.label.text = error.localizedDescription
                h.hide(animated: true, afterDelay: Metric.delay)
            }else{
                if showError == true {
                    let mb = MBProgressHUD.showAdded(to: UIViewController.current().view, animated: true)
                    let image = UIImage(named:"errors.png")?.withRenderingMode(.alwaysTemplate)
                    mb.mode = .customView
                    mb.customView = UIImageView(image: image)
                    mb.label.text = error.localizedDescription
                    mb.hide(animated: true, afterDelay: Metric.delay)
                }
            }
        }
        
        
    }
    
    fileprivate static func getCode(code:Any?) -> Int {
        if code == nil {
            return -1
        } else if code is Int {
            return code as! Int
        } else if code is String {
            return Int(code as! String) ?? -1
        }
        return -1
    }
}

let requestTimeoutClosure = {(endpoint: Endpoint, done: @escaping MoyaProvider<MultiTarget>.RequestResultClosure) in
    
    do {
        var request = try endpoint.urlRequest()
        request.timeoutInterval = Metric.networkTimeOut    //设置请求超时时间
        done(.success(request))
    } catch {
        return
    }
}

