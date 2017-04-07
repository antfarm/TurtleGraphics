//
//  AppDelegate.swift
//  TurtleGraphics
//
//  Created by sean on 30/05/16.
//  Copyright © 2016 antfarm. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let turtleGraphicsVC = window?.rootViewController as! TurtleGraphicsViewController

        let turtle = Turtle()
        turtle.delegate = turtleGraphicsVC

        turtleGraphicsVC.turtleGraphics = TurtleGraphics(turtle: turtle)

        return true
    }
}

