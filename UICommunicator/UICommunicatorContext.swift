//
//  UICommunicatorContext.swift
//  UICommunicator
//
//  Created by 张伟 on 2017/11/26.
//  Copyright © 2017年 zevwings. All rights reserved.
//

import Foundation

public class UICommunicatorContext: NSObject {
    
    public static let shared = UICommunicatorContext()
    
    internal var senders: [String: UICommunicationSender] = [:]
    internal var receivers: [String: UICommunicationReceiver] = [:]
    
    public func clear() {
        self.receivers.removeAll()
    }
}
