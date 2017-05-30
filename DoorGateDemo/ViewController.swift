//
//  ViewController.swift
//  DoorGateDemo
//
//  Created by Casey Liss on 17/5/17.
//  Copyright © 2017 Snagajob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private (set) var walkInButton: UIButton!
    @IBOutlet private (set) var walkOutButton: UIButton!
    @IBOutlet private (set) var peopleInRoomLabel: UILabel!
    @IBOutlet private (set) var roomStateLabel: UILabel!
    
    private var presenter: RoomPresenter!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = RoomPresenter()
        self.presenter.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func walkInButtonTapped() {
        self.presenter.handle(command: .walkIn)
    }
    
    @IBAction func walkOutButtonTapped() {
        self.presenter.handle(command: .walkOut)
    }
    
}

extension ViewController: RoomPresenterDelegate {
    func roomStateChanged(presenter: RoomPresenter, roomState: RoomState) {
        walkInButton.isEnabled = (roomState == .open || roomState == .occupied)
        walkOutButton.isEnabled = (roomState == .occupied || roomState == .locked)
        switch roomState {
        case .locked:
            self.peopleInRoomLabel.text = "👤👤"
            self.roomStateLabel.text = "🔒"
        case .occupied:
            self.peopleInRoomLabel.text = "👤"
            self.roomStateLabel.text = "🚪"
        case .open:
            self.peopleInRoomLabel.text = "⬛️"
            self.roomStateLabel.text = "🆓"
        }
    }
}

