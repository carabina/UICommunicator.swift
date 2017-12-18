//
//  UICommunicationReceiver.swift
//  UICommunicator
//
//  Created by 张伟 on 2017/11/26.
//  Copyright © 2017年 zevwings. All rights reserved.
//

import Foundation

public protocol UICommunicationReceiver: UICommunicationProtocol {
    
    /// 从转发器接收参数
    ///
    /// - Parameter paramertes: 转发参数
    func communicatorSender(transmit paramertes: [String: Any]?)
    
}

public extension UICommunicationReceiver where Self: UIViewController {
    
    func communicatorSender(transmit paramertes: [String: Any]?) {
        localizedMethodError(self, name: #function)
    }
}

public extension UICommunicationReceiver {
    
    
    /// 从接收器回调参数
    ///
    /// - Parameters:
    ///   - paramertes: 回调参数
    ///   - isFinished: 是否结束回调，默认直接结束
    func callback(with paramertes: [String: Any]?, isFinished: Bool = true) {
        
        let identifier = self.communicatorIdentifier
        
        if identifier.isEmpty {
            localizedVariableError(self)
            return
        }
        
        if let sender = UICommunicatorContext.shared.senders[identifier] {
            sender.communicatorReceiver(self, callback: paramertes)
        }
        
        if isFinished {
            UICommunicatorContext.shared.senders.removeValue(forKey: identifier)
        }
    }
}
