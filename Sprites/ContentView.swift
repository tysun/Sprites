//
//  ContentView.swift
//  Sprites
//
//  Created by Tysun Edison on 2023/05/21.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    private let particleManager: ParticleManager
    
    init() {
        let skScene = SKScene(size: UIScreen.main.bounds.size)
        skScene.backgroundColor = .black
        self.particleManager = ParticleManager(in: skScene)
    }
    
    var body: some View {
        SpriteKitView(scene: particleManager.scene)
            .ignoresSafeArea()
            .onAppear {
                launchFireworks()
            }
    }
    
    private func launchFireworks() {
        particleManager.launchFirework()
    }
}

struct SpriteKitView: UIViewRepresentable {
    let scene: SKScene
    
    func makeUIView(context: Context) -> SKView {
        let skView = SKView()
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.presentScene(scene)
            return skView
    }
    
    // Don't need to update the view explicitly, you can remove this because in the SceneDelegate class, add the UIWindowSceneDelegate conformance to the class declaration to satisfy the protocol requirements.
    func updateUIView(_ uiView: SKView, context: Context) {
    }
}

