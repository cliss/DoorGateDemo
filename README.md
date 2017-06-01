# DoorGate Demo
This is a demonstration of a *very* basic [RxSwift](https://github.com/reactivex/rxswift) app.

There are two branches:

* [`master`](https://github.com/cliss/doorgatedemo/) is written using RxSwift
* [`imperative`](https://github.com/cliss/doorgatedemo/tree/imperative) is written using in the traditional/imperative style

The `master` branch uses [Carthage](https://github.com/Carthage/Carthage) to pull in RxSwift.

# Problem Statement
The `DoorGate` app models a very contrived/silly task.

Imagine there is a room that had an automatically locking door. The room and door work as follows:

* When the app begins, there is nobody in the room
* There can be no more than two people in the room at once
* When the second person enters the room, the door automatically shuts and locks from the outside
* Even when the door is shut and locked, a person can walk out of the room
* Only one person can enter or leave at a time

Thus, there are three states that the room can be in:

* 🆓 &mdash; **Open** &mdash; there is nobody in the room. The door is unlocked.
* 🚪 &mdash; **Occupied** &mdash; there is one and only one person in the room. The door is unlocked.
* 🔒 &mdash; **Locked** &mdash; there are two people in the room and the room is locked.

# App
The app looks as follows, in both the imperative and RxSwift versions:

![Screenshot](https://cliss.github.io/DoorGateDemo/images/screenshot.png)

The top label indicates how many people are in the room, with ⬛ representing nobody.

The bottom label indicates the room's/door's state, using the iconography above.

The two buttons are enabled or disabled appropriately based on the state of the room.

# Magic

The "magic" happens in the app in very similar ways between styles:

* The imperative version is in [`RoomPresenter`](https://github.com/cliss/DoorGateDemo/blob/imperative/DoorGateDemo/RoomPresenter.swift)`.handle`.
* The RxSwift version is in [`RoomPresenter`](https://github.com/cliss/DoorGateDemo/blob/master/DoorGateDemo/RoomPresenter.swift)`.`roomAccumulator`.

You'll note the two methods actually look quite similar; the difference is that in the
RxSwift version, it is being used as an accumulator for a [`scan`](http://reactivex.io/documentation/operators/scan.html).

# Other Resources

Websites/Projects:

* [ReactiveX](http://reactivex.io/)
* [RxSwift](https://github.com/ReactiveX/RxSwift)
* [RxMarbles](http://rxmarbles.com)

People:

* [Casey Liss](http://www.caseyliss.com/) or [Twitter](https://twitter.com/caseyliss)
* [Jamie Pinkham](https://github.com/jamiepinkham/) or [Twitter](https://twitter.com/jamiepinkham)