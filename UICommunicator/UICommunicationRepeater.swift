//
//  UICommunicationRepeater.swift
//  UICommunicator
//
//  Created by 张伟 on 2017/11/26.
//  Copyright © 2017年 zevwings. All rights reserved.
//

import Foundation

public protocol UICommunicationRepeater: UICommunicator {
    
    /// 从发送器转发参数到接收器
    ///
    /// - Returns: 接收器(UICommunicationReceiver)
    func transmit() -> UICommunicationReceiver?
}
