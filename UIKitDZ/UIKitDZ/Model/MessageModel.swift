//
//  MessageModel.swift
//  UIKitDZ
//
//  Created by Владислав Лазарев on 22.06.2021.
//  Copyright © 2021 Владислав Лазарев. All rights reserved.
//

import Foundation

struct Message {
    var message: String
    
    func returnNewValue() -> String {
        if message == "leohl" {
            return "hello"
        }
        return "incorrect value"
    }
    
}

