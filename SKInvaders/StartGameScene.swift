//
//  StartGameScene.swift
//  SKInvaders
//
//  Created by Daniel Simons on 5/4/15.
//  Copyright (c) 2015 Razeware. All rights reserved.
//


import UIKit
import SpriteKit

class StartGameScene: SKScene {
    
    // Private GameScene Properties
    
    var contentCreated = false
    
    // Object Lifecycle Management
    
    // Scene Setup and Content Creation
    
    override func didMoveToView(view: SKView) {
        
        if (!self.contentCreated) {
            self.createContent()
            self.contentCreated = true
        }
    }
    
    func createContent() {
        
        let gameTitleLabel = SKLabelNode(fontNamed: "Avenir")
        gameTitleLabel.fontSize = 40
        gameTitleLabel.fontColor = SKColor.whiteColor()
        gameTitleLabel.text = "Election 2016: Space Invaders"
        gameTitleLabel.position = CGPointMake(self.size.width/2, 2.0 / 3.0 * self.size.height);
        
        self.addChild(gameTitleLabel)
        
        let tapLabelBegin = SKLabelNode(fontNamed: "Avenir")
        tapLabelBegin.fontSize = 25
        tapLabelBegin.text = "Beginner";
        tapLabelBegin.fontColor = SKColor.blackColor()
        
        let background = SKSpriteNode(color: SKColor.whiteColor(), size: CGSizeMake(tapLabelBegin.frame.size.width, tapLabelBegin.frame.size.height))
        
        let cropNode = SKCropNode()
        let mask = SKShapeNode(path: CGPathCreateWithRoundedRect(CGRectMake(-15, -15, 30, 30), 4, 4, nil))
        
        [mask setFillColor:[SKColor whiteColor]];
        [cropNode setMaskNode:mask];
        [cropNode addChild:tile];
        
        background.position = CGPointMake(self.size.width/2, gameTitleLabel.frame.origin.y - gameTitleLabel.frame.size.height - 40)
        background.addChild(tapLabelBegin);
        tapLabelBegin.position = CGPointMake(0, -tapLabelBegin.frame.size.height/2);
        
        self.addChild(background);

        
        let tapLabelIntermediate = SKLabelNode(fontNamed: "Avenir")
        tapLabelIntermediate.fontSize = 25
        tapLabelIntermediate.fontColor = SKColor.whiteColor()
        tapLabelIntermediate.text = "Intermediate"
        tapLabelIntermediate.position = CGPointMake(self.size.width/2, background.frame.origin.y - background.frame.size.height - 20);
        
        self.addChild(tapLabelIntermediate)
        
        let tapLabelExpert = SKLabelNode(fontNamed: "Courier")
        tapLabelExpert.fontSize = 25
        tapLabelExpert.fontColor = SKColor.whiteColor()
        tapLabelExpert.text = "Expert"
        tapLabelExpert.position = CGPointMake(self.size.width/2, tapLabelIntermediate.frame.origin.y - tapLabelIntermediate.frame.size.height - 20);
        
        self.addChild(tapLabelExpert)
        
        // black space color
        self.backgroundColor = SKColor.blackColor()
        
    }
    
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent)  {
        
    }
    
    override func touchesCancelled(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent)  {
        
        let gameScene = GameScene(size: self.size)
        gameScene.scaleMode = .AspectFill
        
        self.view?.presentScene(gameScene, transition: SKTransition.doorsCloseHorizontalWithDuration(1.0))
        
    }
}

