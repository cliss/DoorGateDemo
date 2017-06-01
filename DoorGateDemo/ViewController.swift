//
//  ViewController.swift
//  DoorGateDemo
//
//  Created by Casey Liss on 17/5/17.
//  Copyright © 2017 Snagajob. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet private (set) var walkInButton: UIButton!
    @IBOutlet private (set) var walkOutButton: UIButton!
    @IBOutlet private (set) var peopleInRoomLabel: UILabel!
    @IBOutlet private (set) var roomStateLabel: UILabel!
    
    // MARK: Instance Variables
    
    private var presenter: RoomPresenter!
    private var disposeBag = DisposeBag()
    
    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create all the commands
        let walkIn = walkInButton.rx.tap.map { return RoomCommand.walkIn }
        let walkOut = walkOutButton.rx.tap.map { return RoomCommand.walkOut }
        // Merge them so they're all signaling on one observable
        let commands = Observable.of(walkIn, walkOut).merge()
        
        // Create the presenter
        self.presenter = RoomPresenter(commands: commands)
        
        // Bind to the presenter's output
        presenter.occupantsMessage.drive(peopleInRoomLabel.rx.text).disposed(by: disposeBag)
        presenter.stateMessage.drive(roomStateLabel.rx.text).disposed(by: disposeBag)
        presenter.walkInEnabled.drive(walkInButton.rx.isEnabled).disposed(by: disposeBag)
        presenter.walkOutEnabled.drive(walkOutButton.rx.isEnabled).disposed(by: disposeBag)
    }

}

