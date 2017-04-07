//
//  TurtleGraphicsView.swift
//  TurtleGraphics
//
//  Created by sean on 30/05/16.
//  Copyright © 2016 antfarm. All rights reserved.
//

import UIKit


class TurtleGraphicsView: UIView, CAAnimationDelegate {

    var bgColor: CGColor!
    var penColor: CGColor!

    var pathLayer: CAShapeLayer!
    var path: CGMutablePath!


    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        path = CGMutablePath()

        bgColor = UIColor.white.cgColor
        penColor = UIColor(hue: 0.56, saturation: 0.8, brightness: 1.0, alpha: 0.9).cgColor

        backgroundColor = UIColor(cgColor: bgColor)

        pathLayer = {
            let l = CAShapeLayer()
            l.frame = layer.bounds
            l.fillColor = UIColor.clear.cgColor
            l.strokeColor = penColor
            l.lineWidth = 1.8
            return l
        }()

        layer.addSublayer(pathLayer)
    }


    func updatePathForTurtle(_ turtle: Turtle) {

        if turtle.pen {
            path.addLine(to: turtle.position)
        }
        else {
            path.move(to: turtle.position)
        }
    }


    func updateForTurtle(_ turtle: Turtle) {

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

        pathLayer.add(pathAnimation, forKey: "turtlePath")
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
