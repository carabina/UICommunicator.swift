//
//  UICommunicationSender.swift
//  UICommunicator
//
//  Created by 张伟 on 2017/11/26.
//  Copyright © 2017年 zevwings. All rights reserved.
//

import Foundation

public enum UICommunicatorSegue {
    case present
    case push
}

/// 一个通讯发送器需要遵从 UICommunicationProtocol 协议和 NSObjectProtocol 协议
public protocol UICommunicationSender: UICommunicationProtocol, NSObjectProtocol {
    
    /// 从接收器回调获取参数
    ///
    /// - Parameters:
    ///   - receiver: 接收器
    ///   - paramertes: 回调参数
    func receiver(callback paramertes: Any?, by repeater: UICommunicationRepeater)
}

public extension UICommunicationSender {
    
    /// 从接收器回调获取参数
    ///
    /// - Parameters:
    ///   - receiver: 接收器
    ///   - paramertes: 回调参数
    func receiver(callback paramertes: Any?, by repeater: UICommunicationRepeater) {
        localizedMethodError(self, name: #function)
    }
}

public extension UICommunicationSender where Self: UIViewController {
    
    /// 发送器调用转发器
    ///
    /// - Parameters:
    ///   - segue: 跳转方式
    ///   - repeater: 通讯器
    ///   - animated: 是否添加跳转动画
    @discardableResult
    func call<T: UICommunicationRepeater>(_ segue: UICommunicatorSegue,
                                          for repeater: T,
                                          animated: Bool = true)
        -> UIViewController? {
        
        guard let reciever = call(repeater,
                                  shouldCallback: true,
                                  shouldCached: false) else { return nil}
        
        if segue == .present {
            present(reciever, animated: animated, completion: nil)
        } else {
            navigationController?.pushViewController(reciever, animated: animated)
        }
        
        return reciever
    }
    
    /// 发送器转发参数到转发器
    ///
    /// - Parameters:
    ///   - repeter: 转发器
    ///   - shouldCallback: 是否需要回调
    ///   - shouldCached: 是否需要缓存
    /// - Returns: 接收器(UIViewController)
    func call<T: UICommunicationRepeater>(_ repeater: T,
                                          shouldCallback: Bool = false,
                                          shouldCached: Bool = false)
        -> UIViewController? {
        
            guard let receiver = getCommunicationReceiver(by: repeater) else {
                return nil
            }
        
            // 转发数据到 `UICommunicationReceiver`
            if let parameters = repeater.parameters {
                DispatchQueue.main.async {
                    receiver.sender(transmit: parameters, by: repeater)
                }
            }
            
            // 是否需要缓存 `UICommunicationReceiver`
            let repeaterIdentifier = repeater.communicatorIdentifier
            if shouldCached && !repeaterIdentifier.isEmpty {
                UICommunicatorContext.shared.receivers[repeater.communicatorIdentifier] = receiver
            } else if shouldCached && repeaterIdentifier.isEmpty {
                localizedVariableError(repeater)
            }
            
            // 是否需要缓存 `UICommunicationSender` 和 `UICommunicationRepeater`
            let receiverIdentifier = receiver.communicatorIdentifier
            if shouldCallback && !receiverIdentifier.isEmpty {
                UICommunicatorContext.shared.senders[receiverIdentifier] = self
                UICommunicatorContext.shared.repeaters[receiverIdentifier] = repeater
            } else if shouldCallback && receiverIdentifier.isEmpty {
                localizedVariableError(repeater)
            }
            
            return receiver as? UIViewController
    }
    
    public func getCommunicationReceiver<T: UICommunicationRepeater>(by repeater: T)
        -> UICommunicationReceiver? {
        
            let identifier = repeater.communicatorIdentifier
            
            if identifier.isEmpty {
                return repeater.transmit()
            }

            if let receiver = UICommunicatorContext.shared.receivers[identifier] {
                return receiver
            }

            guard let receiver = repeater.transmit() else {
                 return nil
            }
            
            return receiver
    }
}
