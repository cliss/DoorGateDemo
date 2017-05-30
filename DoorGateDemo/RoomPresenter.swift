//
//  RoomPresenter.swift
//  DoorGateDemo
//
//  Created by Casey Liss on 17/5/17.
//  Copyright © 2017 Snagajob. All rights reserved.
//

import Foundation

protocol RoomPresenterDelegate: class {
    func roomStateChanged(presenter: RoomPresenter, roomState: RoomState)
}

class RoomPresenter {
    
    weak var delegate: RoomPresenterDelegate? {
        didSet {
            delegate?.roomStateChanged(presenter: self, roomState: self.roomState)
        }
    }
    private (set) var roomState: RoomState = .open
    init() {
    }
    
    func handle(command: RoomCommand) {
        
        switch (self.roomState, command) {
        case (.open, .walkIn):
            self.roomState = .occupied
        case (.occupied, .walkIn):
            self.roomState = .locked
        case (.locked, .walkOut):
            self.roomState = .occupied
        case (.occupied, .walkOut):
            self.roomState = .open
        default:
            fatalError("Not sure how to match the command \(command) with the state \(self.roomState)!")
        }
        
        delegate?.roomStateChanged(presenter: self, roomState: self.roomState)
    }
}
