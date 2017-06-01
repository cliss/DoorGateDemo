//
//  RoomCommand.swift
//  DoorGateDemo
//
//  Created by Casey Liss on 17/5/17.
//  Copyright © 2017 Snagajob. All rights reserved.
//

import Foundation

/// The commands that can affect the state of the room
///
/// - walkIn: A person has just walked into the room
/// - walkOut: A person has just walked out of the room
enum RoomCommand {
    case walkIn
    case walkOut
}
