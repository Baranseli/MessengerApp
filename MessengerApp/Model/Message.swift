//
//  Message.swift
//  MessengerApp
//
//  Created by Kafkas Baranseli on 23/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import Foundation

// 024 create message class 
class Message {
    private var _content: String
    private var _senderId: String
    
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
    
}
