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
    }


    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)

        turtleGraphics?.draw()
    }


    override var prefersStatusBarHidden : Bool {

        return true
    }
}


extension TurtleGraphicsViewController: TurtleDelegate {

    func turtleChanged(_ turtle: Turtle) {

        turtleGraphicsView.updatePathForTurtle(turtle)
    }


    func turtleNeedsUpdate(_ turtle: Turtle) {

        turtleGraphicsView.updateForTurtle(turtle)
    }
}
