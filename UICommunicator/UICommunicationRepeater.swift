//
//  UICommunicationRepeater.swift
//  UICommunicator
//
//  Created by 张伟 on 2017/11/26.
//  Copyright © 2017年 zevwings. All rights reserved.
//

import Foundation

public protocol UICommunicationRepeater: UICommunicationProtocol {
    
    /// storyboard 名称
    var storyboard: String { get }
    
    /// storyboard 对应 ViewController 的 storyboard id
    var identifier: String { get }
    
    /// storyboard 的存储资源的的位置
    var bundle: Bundle? { get }
    
    /// 从发送器传递的参数
    var parameters: [String: Any]? { get }
    
    /// 从发送器转发参数到接收器
    ///
    /// - Returns: 接收器(UICommunicationReceiver)
    func transmit() -> UICommunicationReceiver?
}

public extension UICommunicationRepeater {
    
    /// storyboard 名称
    var storyboard: String { return "" }
    
    /// storyboard 对应 ViewController 的 storyboard id
    var identifier: String { return "" }
    
    /// storyboard 的存储资源的的位置
    var bundle: Bundle? { return nil }
    
    /// 从发送器传递的参数
    var parameters: [String: Any]? { return nil }

    
    /// 从发送器转发参数到接收器， 只实现UIStoryboard 方式
    ///
    /// - Returns: 接收器(UICommunicationReceiver)
    func transmit() -> UICommunicationReceiver? {
        
        guard storyboard.count > 0 else { return nil }
        guard identifier.count > 0 else { return nil }
        
        let sb = UIStoryboard(name: storyboard, bundle: bundle)
        let vc = sb.instantiateViewController(withIdentifier: identifier) as? UICommunicationReceiver

        DispatchQueue.main.async {
            if let param = self.parameters {
                vc?.communicatorSender(by: self, transmit: param)
            }
        }
        return vc
    }
}
