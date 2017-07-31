//
//  RoomState.swift
//  DoorGateDemo
//
//  Created by Casey Liss on 17/5/17.
//  Copyright © 2017 Casey Liss. All rights reserved.
//

import Foundation
import ReSwift

enum RoomState {
    case open
    case occupied
    case locked
}

extension RoomState: StateType {}
