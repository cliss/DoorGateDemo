//
//  RoomActions.swift
//  DoorGateDemo
//
//  Created by Casey Liss on 31/7/17.
//  Copyright © 2017 Casey Liss. All rights reserved.
//

import ReSwift

struct WalkInAction: Action, CustomDebugStringConvertible {
    var debugDescription: String {
        return "walkIn"
    }
}

struct WalkOutAction: Action, CustomDebugStringConvertible {
    var debugDescription: String {
        return "walkOut"
    }
}
