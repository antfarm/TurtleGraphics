//
//  Turtle.swift
//  TurtleGraphics
//
//  Created by sean on 30/05/16.
//  Copyright © 2016 antfarm. All rights reserved.
//

import CoreGraphics


protocol TurtleDelegate {

    func turtleChanged(turtle: Turtle)

    func turtleNeedsUpdate(turtle: Turtle)
}


class Turtle {

    private(set) var position: CGPoint
    private(set) var pen: Bool

    private var heading: Float

    var delegate: TurtleDelegate?


    init() {

        position = CGPointZero
        heading = 0
        pen = false
    }


    func reset() {

        penUp()
        home()
        rotateToHeading(0)
        penDown()
    }


    func home() {
        moveToPosition(CGPoint(x: 512, y: 364))
    }


    func forward(units: Float) {
        moveByDistance(units)
    }


    func back(units: Float) {
        moveByDistance(-units)
    }


    func left(degrees: Float) {
        rotateByAngle(degrees)
    }


    func right(degrees: Float) {
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


    private func moveToPosition(position: CGPoint) {

        self.position = position
        delegate?.turtleChanged(self)
    }


    private func rotateToHeading(heading: Float) {

        self.heading = heading
        delegate?.turtleChanged(self)
    }


    private func moveByDistance(units: Float) {

        let π = Float(M_PI)
        position.x += CGFloat(units * cos(heading / 180.0 * π))
        position.y += CGFloat(units * sin(heading / 180.0 * π))
        delegate?.turtleChanged(self)
    }


    private func rotateByAngle(degrees: Float) {

        heading = heading + degrees
        delegate?.turtleChanged(self)
    }
    
    
    private func setPen(pen: Bool) {
        
        self.pen = pen
        delegate?.turtleChanged(self)
    }
}