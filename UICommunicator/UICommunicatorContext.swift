//
//  UICommunicatorContext.swift
//  UICommunicator
//
//  Created by 张伟 on 2017/11/26.
//  Copyright © 2017年 zevwings. All rights reserved.
//

import Foundation

/// 管理缓存如下协议类型的，请注意释放缓存池类的数据
/// 1.UICommunicationSender
/// 2.UICommunicationReceiver
/// 3.UICommunicationRepeater
public class UICommunicatorContext: NSObject {
    
    public static let shared = UICommunicatorContext()
    
    public var senders: [String: UICommunicationSender] = [:]
    public var receivers: [String: UICommunicationReceiver] = [:]
    public var repeaters: [String: UICommunicationRepeater] = [:]
    
    public func clear() {
        receivers.removeAll()
    }
}
