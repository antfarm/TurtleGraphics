//
//  Turtle.swift
//  TurtleGraphics
//
//  Created by sean on 30/05/16.
//  Copyright © 2016 antfarm. All rights reserved.
//

import CoreGraphics


protocol TurtleDelegate {

    func turtleChanged(_ turtle: Turtle)

    func turtleNeedsUpdate(_ turtle: Turtle)
}


class Turtle {

    private(set) var position = CGPoint.zero
    private(set) var pen = false

    private var heading = Float(0)

    private var homePosition: CGPoint

    var delegate: TurtleDelegate?


    init(home homePosition: CGPoint) {

        self.homePosition = homePosition
    }


    func reset() {

        penUp()
        home()
        rotateToHeading(0)
        penDown()
    }


    func home() {
        moveToPosition(homePosition)
    }


    func forward(_ units: Float) {
        moveByDistance(units)
    }


    func back(_ units: Float) {
        moveByDistance(-units)
    }


    func left(_ degrees: Float) {
        rotateByAngle(degrees)
    }


    func right(_ degrees: Float) {
        rotateByAngle(degrees)
    }


    func penDown() {
        setPen(true)
    }


    func penUp() {
        setPen(false)
    }


    func update() {
        delegate?.turtleNeedsUpdate(self)
    }


    fileprivate func moveToPosition(_ position: CGPoint) {

        self.position = position
        delegate?.turtleChanged(self)
    }


    fileprivate func rotateToHeading(_ heading: Float) {

        self.heading = heading
        delegate?.turtleChanged(self)
    }


    fileprivate func moveByDistance(_ units: Float) {

        let π = Float.pi
        position.x += CGFloat(units * cos(heading / 180.0 * π))
        position.y += CGFloat(units * sin(heading / 180.0 * π))
        delegate?.turtleChanged(self)
    }


    fileprivate func rotateByAngle(_ degrees: Float) {

        heading = heading + degrees
        delegate?.turtleChanged(self)
    }
    
    
    fileprivate func setPen(_ pen: Bool) {
        
        self.pen = pen
        delegate?.turtleChanged(self)
    }
}
