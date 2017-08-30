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
    
    var startPosition: CGPoint?
    var activeCircle: SKShapeNode?
    var circles: [SKShapeNode] = []
    
    let threshold: CGFloat = 50.0 // how far away before we highlight

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameView.frame = view.frame

        for _ in 0..<10 {
            let circle = SKShapeNode(circleOfRadius: 30)
            circle.fillColor = .green
            
            let w = Int(gameScene.size.width)
            let h = Int(gameScene.size.height)
            let x = randomNumber(inRange: 0...w)
            let y = randomNumber(inRange: 0...h)

            circle.position = CGPoint(x: CGFloat(x) , y: CGFloat(y))
            circle.name = "circle"
            circle.isUserInteractionEnabled = true
            
            circles.append(circle)
            gameScene.addChild(circle)
        }


        gameView.presentScene(gameScene)
        view.addSubview(gameView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let positionInScene = touch.location(in: gameScene)
            let touchedNodes = gameScene.nodes(at: positionInScene)
            
            if let circle = touchedNodes.first as? SKShapeNode, circle.name == "circle" {
                activeCircle = circle
                activeCircle!.fillColor = .red
                activeCircle!.zPosition = 100
                
                // remember the offset from where we touched, so the circle follows are hand without snapping.
                startPosition = CGPoint(x: activeCircle!.position.x - positionInScene.x, y: activeCircle!.position.y - positionInScene.y)
            }

        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let position = startPosition, let touch = touches.first, let circle = activeCircle {
            let positionInScene = touch.location(in: gameScene)
            circle.position = CGPoint(x: positionInScene.x + position.x, y: positionInScene.y + position.y)
            
            for testCircle in circles {
                if testCircle != circle {
                    if distance(circle.position, testCircle.position) < threshold {
                        testCircle.fillColor = .blue
                    }
                    else {
                        testCircle.fillColor = .green
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for circle in circles {
            circle.fillColor = .green
        }

        activeCircle = nil
        startPosition = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

