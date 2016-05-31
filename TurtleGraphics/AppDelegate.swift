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


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let turtleGraphicsVC = window?.rootViewController as! TurtleGraphicsViewController

        let turtle = Turtle()
        turtle.delegate = turtleGraphicsVC

        turtleGraphicsVC.turtleGraphics = TurtleGraphics(turtle: turtle)

        return true
    }
}

