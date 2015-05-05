

import UIKit
import SpriteKit

class GameOverScene: SKScene {
   
    // Private GameScene Properties
    
    var contentCreated = false
    
    // Object Lifecycle Management
    
    // Scene Setup and Content Creation
    
    override func didMoveToView(view: SKView) {
        
        if (!self.contentCreated) {
            self.createContent()
            self.contentCreated = true
            
            delay(3.5) {
                // do stuff
                let startGameScene = StartGameScene(size: self.size)
                startGameScene.scaleMode = .AspectFill
                self.view?.presentScene(startGameScene, transition: SKTransition.crossFadeWithDuration(1.0))
            }
        }
    }
    
    func createContent() {
        
        let gameOverLabel = SKLabelNode(fontNamed: "Courier")
        gameOverLabel.fontSize = 50
        gameOverLabel.fontColor = SKColor.whiteColor()
        gameOverLabel.text = "Game Over!"
        gameOverLabel.position = CGPointMake(self.size.width/2, 2.0 / 3.0 * self.size.height);
        
        self.addChild(gameOverLabel)
        
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
        
        

        
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
}
