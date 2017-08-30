//
//  ViewController.swift
//  Prototype
//
//  Created by Jamie Kosoy on 8/30/17.
//  Copyright © 2017 Melody Jams. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    let gameScene = SKScene()
    let gameView = SKView()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameView.frame = view.frame

        gameView.presentScene(gameScene)
        view.addSubview(gameView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

