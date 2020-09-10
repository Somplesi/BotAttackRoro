//
//  Player.swift
//  App_Console
//
//  Created by Rodolphe DUPUY on 09/09/2020.
//  Copyright © 2020 mbritto. All rights reserved.
//

import Foundation

class Player {
    var nickname: String
    var force: Int = 1
    var health: Int = 100
    
    init (nickname: String) {
        self.nickname = nickname
    }
}
