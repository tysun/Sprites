//
//  ParticleManager.swift
//  Sprites
//
//  Created by Tysun Edison on 2023/05/21.
//

import SpriteKit

class ParticleManager {
    // internal or remove the access level modifier altogether
    internal let scene: SKScene
    private let emitter: SKEmitterNode
    
    init(in scene: SKScene) {
        self.scene = scene
        self.emitter = SKEmitterNode(fileNamed: "FireworksScene")!
        self.emitter.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        self.scene.addChild(self.emitter)
    }
    
    func launchFirework() {
        let firework = SKEmitterNode(fileNamed: "FireworksScene")!
        firework.position = CGPoint(x: scene.size.width / 2, y: 0)
        scene.addChild(firework)

        let explodeAction = SKAction.run {
            firework.particleBirthRate = 0
        }

        let removeAction = SKAction.run {
            firework.removeFromParent()
        }

        let sequence = SKAction.sequence([explodeAction, SKAction.wait(forDuration: 2), removeAction])
        firework.run(sequence)
    }

}

