//
//  SecondRepeator.swift
//  Exmaple
//
//  Created by 张伟 on 16/12/2017.
//  Copyright © 2017 zevwings. All rights reserved.
//

import Foundation
import UIComminicator

public enum SecondRepeater {
    case `default`(paramerts: [String: Any]?)
}

extension SecondRepeater: UICommunicationRepeater {
    
    public var storyboard: String {
        switch self {
        case .default:
            return "Main"
        }
    }
    
    public var identifier: String {
        
        switch self {
        case .default:
            return "SecondViewController"
        }
    }
    
    public var parameters: [String : Any]? {
        switch self {
        case .default(let paramerts):
            return paramerts
        }
    }
}
