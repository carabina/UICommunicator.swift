//
//  UICommunicator.swift
//  Alamofire
//
//  Created by zevwings on 2017/11/24.
//

import UIKit

//MARK: - UICommunicator
public protocol UICommunicator {

    /// 通讯器唯一标志，默认为空，建议 模块名称.通讯器名称，如：Login.LoginCommunicationSender
    var communicatorIdentifier: String { get }
}

public extension UICommunicator {
    
    var communicatorIdentifier: String {
        return ""
    }
}
