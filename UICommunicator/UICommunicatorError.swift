//
//  UICommunicatorError.swift
//  UICommunicator
//
//  Created by 张伟 on 2017/11/26.
//  Copyright © 2017年 zevwings. All rights reserved.
//

import Foundation

func localizedVariableError(_ communicator: UICommunicationProtocol) {
    
    #if DEBUG
        let message = "identifier is Empty, You should implement 'communicatorIdentifier' variable in \(communicator)"
        print(message)
    #endif

}

func localizedMethodError(_ communicator: UICommunicationProtocol, name: String) {
    
    #if DEBUG
        let message = "\(communicator) does not implement the function \(name), You should implement this option function when you want to receive message from the communication sender."
        print(message)
    #endif
}
