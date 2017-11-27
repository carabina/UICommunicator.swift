//
//  UICommunicationSender.swift
//  UICommunicator
//
//  Created by 张伟 on 2017/11/26.
//  Copyright © 2017年 zevwings. All rights reserved.
//

import Foundation

public protocol UICommunicationSender: UICommunicator where Self: UIViewController {
    
    /// 从接收器回调获取参数
    ///
    /// - Parameters:
    ///   - receiver: 接收器
    ///   - paramertes: 回调参数
    func communicatorReceiver(_ receiver: UICommunicationReceiver?, callback paramertes: [String: Any]?)
}

public extension UICommunicationSender {
    
    /// 从接收器回调获取参数
    ///
    /// - Parameters:
    ///   - receiver: 接收器
    ///   - paramertes: 回调参数
    func communicatorReceiver(_ receiver: UICommunicationReceiver?, callback paramertes: [String: Any]?) {
        
        localizedMethodError(self, name: #function)
    }
}

public extension UICommunicationSender {
    
    /// 发送器转发参数到转发器
    ///
    /// - Parameters:
    ///   - repeter: 转发器
    ///   - shouldCallback: 是否需要回调
    ///   - shouldCached: 是否需要缓存
    /// - Returns: 接收器(UIViewController)
    func transmit<T: UICommunicationRepeater>(by repeter: T, shouldCallback: Bool = false, shouldCached: Bool = false) -> UIViewController? {
        
        let receiver = self.getCommunicationReceiver(by: repeter, shouldCached: shouldCached)
        
        if shouldCallback,
            let identifier = receiver?.communicatorIdentifier,
            !identifier.isEmpty {
            
            UICommunicatorContext.shared.senders[identifier] = self
        }
        
        return receiver as? UIViewController
    }
    
    private func getCommunicationReceiver<T: UICommunicationRepeater>(by repeter: T, shouldCached: Bool) -> UICommunicationReceiver? {
        
        let identifier = repeter.communicatorIdentifier
        
        if !shouldCached {
            return repeter.transmit()
        }
        
        if identifier.isEmpty {
            localizedVariableError(repeter)
            return repeter.transmit()
        }
        
        if let receiver = UICommunicatorContext.shared.receivers[identifier] {
            return receiver
        }
        
        guard let receiver = repeter.transmit() else {
            return nil
        }
        
        UICommunicatorContext.shared.receivers[identifier] = receiver
        
        return receiver
    }
}
