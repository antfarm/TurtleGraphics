//
//  TurtleGraphicsViewController.swift
//  TurtleGraphics
//
//  Created by sean on 30/05/16.
//  Copyright © 2016 antfarm. All rights reserved.
//

import UIKit

class TurtleGraphicsViewController: UIViewController {

    @IBOutlet var turtleGraphicsView: TurtleGraphicsView!

    var turtleGraphics: TurtleGraphics?


    override func viewDidLoad() {

        super.viewDidLoad()

        view.layoutIfNeeded()

        turtleGraphics?.draw()
    }


    override func prefersStatusBarHidden() -> Bool {

        return true
    }
}


extension TurtleGraphicsViewController: TurtleDelegate {

    func turtleChanged(turtle: Turtle) {

        turtleGraphicsView.updatePathForTurtle(turtle)
    }


    func turtleNeedsUpdate(turtle: Turtle) {

        turtleGraphicsView.updateForTurtle(turtle)
    }
}
