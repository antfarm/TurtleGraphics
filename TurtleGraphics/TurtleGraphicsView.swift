//
//  TurtleGraphicsView.swift
//  TurtleGraphics
//
//  Created by sean on 30/05/16.
//  Copyright © 2016 antfarm. All rights reserved.
//

import UIKit


class TurtleGraphicsView: UIView {

    var bgColor: CGColor!
    var penColor: CGColor!

    var pathLayer: CAShapeLayer!
    var path: CGMutablePath!


    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        path = CGPathCreateMutable()

        bgColor = UIColor.whiteColor().CGColor
        penColor = UIColor(hue: 0.56, saturation: 0.8, brightness: 1.0, alpha: 0.9).CGColor

        backgroundColor = UIColor(CGColor: bgColor)

        pathLayer = {
            let l = CAShapeLayer()
            l.frame = layer.bounds
            l.fillColor = UIColor.clearColor().CGColor
            l.strokeColor = penColor
            l.lineWidth = 1.8
            return l
        }()

        layer.addSublayer(pathLayer)
    }


    func updatePathForTurtle(turtle: Turtle) {

        if turtle.pen {
            CGPathAddLineToPoint(path, nil, turtle.position.x, turtle.position.y)
        }
        else {
            CGPathMoveToPoint(path, nil, turtle.position.x, turtle.position.y)
        }
    }


    func updateForTurtle(turtle: Turtle) {

        pathLayer.path = path

        let pathAnimation: CABasicAnimation = {
            let a = CABasicAnimation(keyPath: "strokeEnd")
            a.duration = 20.0
            a.fromValue = 0
            a.toValue = 1
            a.delegate = self
//            a.removedOnCompletion = false
            return a
        }()

        pathLayer.addAnimation(pathAnimation, forKey: "turtlePath")

        pathLayer.setNeedsDisplay()
        setNeedsDisplay()
    }


//    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
//
//        if let turtleAnim = pathLayer.animationForKey("turtlePath") {
//            if anim == turtleAnim {
//                if flag {
//                    pathLayer.removeAnimationForKey("turtlePath")
//                }
//            }
//        }
//    }
}