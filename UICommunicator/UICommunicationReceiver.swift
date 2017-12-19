//
//  UICommunicationReceiver.swift
//  UICommunicator
//
//  Created by 张伟 on 2017/11/26.
//  Copyright © 2017年 zevwings. All rights reserved.
//

import Foundation

/// 一个通讯接收器需要遵从 UICommunicationProtocol 协议和 NSObjectProtocol 协议
public protocol UICommunicationReceiver: UICommunicationProtocol, NSObjectProtocol {
    
    /// 从转发器接收参数
    ///
    /// - Parameter paramertes: 转发参数
    func sender(transmit paramertes: Any?, by repeater: UICommunicationRepeater)
}

public extension UICommunicationReceiver where Self: UIViewController {
    
    func sender(transmit paramertes: Any?, by repeater: UICommunicationRepeater) {
        localizedMethodError(self, name: #function)
    }
}

public extension UICommunicationReceiver {
    
    
    /// 从接收器回调参数
    ///
    /// - Parameters:
    ///   - paramertes: 回调参数
    ///   - isFinished: 是否结束回调，默认直接结束
    @discardableResult
    func callback(with paramertes: Any? = nil, isFinished: Bool = true) -> UICommunicationSender? {
        
        let receiverIdentifier = communicatorIdentifier
        
        guard !receiverIdentifier.isEmpty else {
            localizedVariableError(self)
            return nil
        }

        let sender = UICommunicatorContext.shared.senders[receiverIdentifier]
        let repeater = UICommunicatorContext.shared.repeaters[receiverIdentifier]
        
        if let p = paramertes, let r = repeater {
            sender?.receiver(callback: p, by: r)
        }
        
        if isFinished {
            UICommunicatorContext.shared.senders[receiverIdentifier] = nil
            UICommunicatorContext.shared.repeaters[receiverIdentifier] = nil
        }
        
        return sender
    }
}
