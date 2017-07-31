//
//  RoomReducer.swift
//  DoorGateDemo
//
//  Created by Casey Liss on 31/7/17.
//  Copyright © 2017 Casey Liss. All rights reserved.
//

import Foundation
import ReSwift

class RoomReducer {
    static func roomReducer(action: Action, state: RoomState?) -> RoomState {
        var state = state ?? .open
        
        switch (state, action) {
        case (.open, _ as WalkInAction):
            fallthrough
        case (.locked, _ as WalkOutAction):
            state = .occupied
        case (.occupied, _ as WalkInAction):
            state = .locked
        case (.occupied, _ as WalkOutAction):
            state = .open
        default:
            fatalError("Could not transition from \(state) with \(action)!")
        }
        
        return state
    }
}
