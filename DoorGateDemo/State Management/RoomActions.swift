//
//  RoomActions.swift
//  DoorGateDemo
//
//  Created by Casey Liss on 31/7/17.
//  Copyright © 2017 Casey Liss. All rights reserved.
//

import ReSwift
import ReSwiftRecorder

let walkActionsTypeMap: TypeMap = ["WalkInAction": WalkInAction.self,
                                    "WalkOutAction": WalkOutAction.self]

struct WalkInAction: Action, ReSwiftRecorder.StandardActionConvertible, CustomDebugStringConvertible {
    
    init() { }
    
    init(_ standardAction: ReSwiftRecorder.StandardAction) { }
    
    func toStandardAction() -> ReSwiftRecorder.StandardAction {
        return StandardAction(type: String(describing: type(of: self)),
                              payload: [:],
                              isTypedAction: true)
    }
    
    var debugDescription: String {
        return "walkIn"
    }
}

struct WalkOutAction: Action, ReSwiftRecorder.StandardActionConvertible, CustomDebugStringConvertible {
    
    init() { }
    
    init(_ standardAction: ReSwiftRecorder.StandardAction) { }
    
    func toStandardAction() -> ReSwiftRecorder.StandardAction {
        return StandardAction(type: String(describing: type(of: self)),
                              payload: [:],
                              isTypedAction: true)
    }
    
    var debugDescription: String {
        return "walkOut"
    }
}
