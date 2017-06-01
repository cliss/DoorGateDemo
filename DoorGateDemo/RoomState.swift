//
//  RoomState.swift
//  DoorGateDemo
//
//  Created by Casey Liss on 17/5/17.
//  Copyright © 2017 Snagajob. All rights reserved.
//

import Foundation


/// The state of the room.
///
/// - open: The room is open (there are no people inside it)
/// - occupied: The room is occupied (there is one person inside it)
/// - locked: The room is locked (there are two people inside it)
enum RoomState {
    case open
    case occupied
    case locked
}
