//
//  ViewController.swift
//  DoorGateDemo
//
//  Created by Casey Liss on 17/5/17.
//  Copyright © 2017 Casey Liss. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController {
    
    @IBOutlet private (set) var walkInButton: UIButton!
    @IBOutlet private (set) var walkOutButton: UIButton!
    @IBOutlet private (set) var peopleInRoomLabel: UILabel!
    @IBOutlet private (set) var roomStateLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        roomStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        roomStore.unsubscribe(self)
    }
    
    @IBAction func walkInButtonTapped() {
        roomStore.dispatch(WalkInAction())
    }
    
    @IBAction func walkOutButtonTapped() {
        roomStore.dispatch(WalkOutAction())
    }
    
}

extension ViewController: StoreSubscriber {
    
    func newState(state: RoomState) {
        
        switch state {
        case .open:
            self.walkInButton.isEnabled = true
            self.walkOutButton.isEnabled = false
            self.peopleInRoomLabel.text = "⬛"
            self.roomStateLabel.text = "🆓"
        case .occupied:
            self.walkInButton.isEnabled = true
            self.walkOutButton.isEnabled = true
            self.peopleInRoomLabel.text = "👤"
            self.roomStateLabel.text = "🚪"
        case .locked:
            self.walkInButton.isEnabled = false
            self.walkOutButton.isEnabled = true
            self.peopleInRoomLabel.text = "👤👤"
            self.roomStateLabel.text = "🔒"
        }
    }
}
