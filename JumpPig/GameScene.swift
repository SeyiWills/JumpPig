//
//  GameScene.swift
//  JumpPig
//
//  Created by Student on 4/27/16.
//  Copyright (c) 2016 Oluwaseyi Williams. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    
    
    
    
    // Tap To Start node
    let tapToStartNode = SKSpriteNode(imageNamed: "TapToStart")
    
    
    // Layered Nodes
    var backgroundNode: SKNode!
    var midgroundNode: SKNode!
    var foregroundNode: SKNode!
    var hudNode: SKNode!
    
    // To Accommodate iPhone 6
    var scaleFactor: CGFloat!
    var player: SKNode!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = SKColor.whiteColor()
        
        
        // Add some gravity
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        
        scaleFactor = self.size.width / 320.0
        
        // Create the game nodes
        // Background
        backgroundNode = createBackgroundNode()
        addChild(backgroundNode)
        
        // Foreground
        foregroundNode = SKNode()
        addChild(foregroundNode)
        
        // HUD
        hudNode = SKNode()
        addChild(hudNode)
        
        
       /* // Add a star
        let star = createCarrotAtPosition(CGPoint(x: 160, y: 220))
        foregroundNode.addChild(star)*/
        
        // Add the player
        player = createPlayer()
        foregroundNode.addChild(player)
        
        
    }
    

    
    
    
    
    
    func createBackgroundNode() -> SKNode {
        // 1
        // Create the node
        let backgroundNode = SKNode()
        let ySpacing = 64.0 * scaleFactor
        
        // 2
        // Go through images until the entire background is built
        for index in 0...0 {
            // 3
            let node = SKSpriteNode(imageNamed:String(format: "Background", index + 1))
            // 4
            node.setScale(scaleFactor)
            node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            node.position = CGPoint(x: self.size.width / 2, y: ySpacing * CGFloat(index))
            //5
            backgroundNode.addChild(node)
            
            
            
        }
        
        // 6
        // Return the completed background node
        return backgroundNode
    }
    
    
    func createPlayer() -> SKNode {
        let playerNode = SKNode()
        playerNode.position = CGPoint(x: self.size.width / 2, y: 80.0)
        
        let sprite = SKSpriteNode(imageNamed: "Pig")
        playerNode.addChild(sprite)
        
        // Tap to Start
        tapToStartNode.position = CGPoint(x: self.size.width / 2, y: 180.0)
        hudNode.addChild(tapToStartNode)
        
        
        // 1
        playerNode.physicsBody = SKPhysicsBody(circleOfRadius: sprite.size.width / 2)
        // 2
        playerNode.physicsBody?.dynamic = false
        // 3
        playerNode.physicsBody?.allowsRotation = false
        // 4
        playerNode.physicsBody?.restitution = 1.0
        playerNode.physicsBody?.friction = 0.0
        playerNode.physicsBody?.angularDamping = 0.0
        playerNode.physicsBody?.linearDamping = 0.0
        
        
        // 1
        playerNode.physicsBody?.usesPreciseCollisionDetection = true
        // 2
        playerNode.physicsBody?.categoryBitMask = CollisionCategoryBitmask.Player
        // 3
        playerNode.physicsBody?.collisionBitMask = 0
        // 4
        playerNode.physicsBody?.contactTestBitMask = CollisionCategoryBitmask.Star | CollisionCategoryBitmask.Platform
        
        
        
        
        
        return playerNode
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        // 1
        // If we're already playing, ignore touches
        if player.physicsBody!.dynamic {
            return
        }
        
        // 2
        // Remove the Tap to Start node
        tapToStartNode.removeFromParent()
        
        // 3
        // Start the player by putting them into the physics simulation
        player.physicsBody?.dynamic = true
        
        // 4
        player.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 20.0))
    
        
    }
    
    
   /* func createCarrotAtPosition(position: CGPoint) -> CarrotNode {
        // 1
        let node = CarrotNode()
        let thePosition = CGPoint(x: position.x * scaleFactor, y: position.y)
        node.position = thePosition
        node.name = "Node_Carrot"
        
        // 2
        var sprite: SKSpriteNode
        sprite = SKSpriteNode(imageNamed: "Carrot")
        node.addChild(sprite)
        
        // 3
        node.physicsBody = SKPhysicsBody(circleOfRadius: sprite.size.width / 2)
        
        // 4
        node.physicsBody?.dynamic = false
        
        return node
    }*/
    
    
    
 
    
    
}




