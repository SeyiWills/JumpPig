//
//  GameViewController.swift
//  JumpPig
//
//  Created by Student on 4/27/16.
//  Copyright (c) 2016 Oluwaseyi Williams. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = self.view as! SKView
        
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        let scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFit
        
        skView.presentScene(scene)
    }
}
