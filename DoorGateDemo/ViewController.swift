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
    
    @IBOutlet private (set) var walkInButton: UIButton!
    @IBOutlet private (set) var walkOutButton: UIButton!
    @IBOutlet private (set) var peopleInRoomLabel: UILabel!
    @IBOutlet private (set) var roomStateLabel: UILabel!
    
    private var presenter: RoomPresenter!
    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let walkIn = walkInButton.rx.tap.map { return RoomCommand.walkIn }
        let walkOut = walkOutButton.rx.tap.map { return RoomCommand.walkOut }
        
        let commands = Observable.of(walkIn, walkOut).merge()
        
        self.presenter = RoomPresenter(commands: commands)
        
        presenter.occupantsMessage.drive(peopleInRoomLabel.rx.text).disposed(by: disposeBag)
        presenter.stateMessage.drive(roomStateLabel.rx.text).disposed(by: disposeBag)
        presenter.walkInEnabled.drive(walkInButton.rx.isEnabled).disposed(by: disposeBag)
        presenter.walkOutEnabled.drive(walkOutButton.rx.isEnabled).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

