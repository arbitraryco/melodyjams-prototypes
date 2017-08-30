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
    let gameScene = SKScene(size: CGSize(width: 1024, height: 768))
    let gameView = SKView()
    let circle = SKShapeNode(circleOfRadius: 30)
    
    var startPosition: CGPoint?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameView.frame = view.frame

        circle.fillColor = .green
        circle.position = CGPoint(x: gameScene.size.width / 2, y: gameScene.size.height / 2)
        circle.name = "circle"
        circle.isUserInteractionEnabled = true
        
        gameScene.addChild(circle)

        gameView.presentScene(gameScene)
        view.addSubview(gameView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let positionInScene = touch.location(in: gameScene)
            let touchedNodes = gameScene.nodes(at: positionInScene)
            
            if let circle = touchedNodes.first as? SKShapeNode, circle.name == "circle" {
                circle.fillColor = .red
                
                // remember the offset from where we touched, so the circle follows are hand without snapping.
                startPosition = CGPoint(x: circle.position.x - positionInScene.x, y: circle.position.y - positionInScene.y)
            }

        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let position = startPosition, let touch = touches.first {
            let positionInScene = touch.location(in: gameScene)
            circle.position = CGPoint(x: positionInScene.x + position.x, y: positionInScene.y + position.y)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        circle.fillColor = .green
        startPosition = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

