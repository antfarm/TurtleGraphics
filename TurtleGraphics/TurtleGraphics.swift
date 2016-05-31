//
//  TurtleGraphics.swift
//  TurtleGraphics
//
//  Created by sean on 31/05/16.
//  Copyright © 2016 antfarm. All rights reserved.
//

import Foundation

class TurtleGraphics {

    let turtle: Turtle


    init(turtle: Turtle) {

        self.turtle = turtle
    }


    func draw() {

        turtle.home()
        turtle.penDown()

        var x: Float = 80

        repeat_n(3) {
            self.star(m: 6, n: 5, x: x)
            x += 60
        }

        turtle.update()
    }


    private func polygon(n n: Int, x: Float) {

        repeat_n(n) {
            self.turtle.right(360.0 / Float(n))
            self.turtle.forward(x)
        }
    }

    
    private func star(m m: Int, n: Int, x: Float) {

        repeat_n(m) {
            self.polygon(n: n, x: x)
            self.turtle.right(360.0 / Float(m))
        }
    }


    private func repeat_n(n: Int, closure: () -> ()) {

        for _ in (1...n) {
            closure()
        }
    }
}