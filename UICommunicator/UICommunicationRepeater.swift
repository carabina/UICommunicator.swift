//
//  UICommunicationRepeater.swift
//  UICommunicator
//
//  Created by 张伟 on 2017/11/26.
//  Copyright © 2017年 zevwings. All rights reserved.
//

import Foundation

public protocol UICommunicationRepeater: UICommunicator {
    
    var storyboard: String { get }
    
    var identifier: String { get }
    
    var parameters: [String: Any]? { get }
    
    /// 从发送器转发参数到接收器
    ///
    /// - Returns: 接收器(UICommunicationReceiver)
    func transmit() -> UICommunicationReceiver?
}

public extension UICommunicationRepeater {
    
    func transmit() -> UICommunicationReceiver? {
        
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: identifier) as? UICommunicationReceiver
        DispatchQueue.main.async {
            if let param = self.parameters {
                vc?.communicatorSender(transmit: param)
            }
        }
        return vc
    }
}
