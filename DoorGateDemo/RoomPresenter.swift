//
//  RoomPresenter.swift
//  DoorGateDemo
//
//  Created by Casey Liss on 17/5/17.
//  Copyright © 2017 Snagajob. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RoomPresenter {
    
    // MARK: Output Observables 
    
    let roomState: Driver<RoomState>
    let walkInEnabled: Driver<Bool>
    let walkOutEnabled: Driver<Bool>
    let occupantsMessage: Driver<String>
    let stateMessage: Driver<String>
    
    // MARK: Initializer
    
    init(commands: Observable<RoomCommand>) {
        // Set up the state observable by scanning the commands.
        // To keep things cleaner here, we'll move the accumulator 
        // to its own function below.
        let state = commands.scan(.open, accumulator: RoomPresenter.roomAccumulator)
            .asDriver(onErrorJustReturn: .open)
            // Without this startWith(), the state won't fire until after the
            // user taps a button. This starts things off at a good state.
            .startWith(.open)
        self.roomState = state
        
        // Based on that state observable, map out all the output observables.
        
        self.walkInEnabled = state.map {
            switch $0 {
            case .locked:
                return false
            default:
                return true
            }
        }
        
        self.walkOutEnabled = state.map {
            switch $0 {
            case .occupied:
                fallthrough
            case .locked:
                return true
            default:
                return false
            }
        }
        
        self.occupantsMessage = state.map {
            switch $0 {
            case .occupied:
                return "👤"
            case .locked:
                return "👤👤"
            case .open:
                return "⬛️"
            }
        }
        
        self.stateMessage = state.map {
            switch $0 {
            case .open:
                return "🆓"
            case .occupied:
                return "🚪"
            case .locked:
                return "🔒"
            }
        }
    }
    
    private static func roomAccumulator(prevState: RoomState, command: RoomCommand) -> RoomState {
        switch (prevState, command) {
        case (.open, .walkIn):
            return .occupied
        case (.occupied, .walkIn):
            return .locked
        case (.locked, .walkOut):
            return .occupied
        case (.occupied, .walkOut):
            return .open
        default:
            // This transition is impossible; die violently.
            fatalError("Not sure how to match the command \(command) with the state \(prevState)!")
        }
    }
}
