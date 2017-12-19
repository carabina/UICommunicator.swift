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
    
    public internal(set) var senders: [String: UICommunicationSender] = [:]
    public internal(set) var receivers: [String: UICommunicationReceiver] = [:]
    public internal(set) var repeaters: [String: UICommunicationRepeater] = [:]
    
    public func clear() {
        receivers.removeAll()
    }
    
    public func removeSender(by identifier: String) {
        senders.removeValue(forKey: identifier)
    }
    
    public func removeReceiver(by identifier: String) {
        receivers.removeValue(forKey: identifier)
    }
    
    public func removeRepeaters(by identifier: String) {
        repeaters.removeValue(forKey: identifier)
    }
}
