//
//  BadgeView.swift
//  Atletas
//
//  Created by Guilerme Barciki on 12/09/21.
//

import UIKit
import SceneKit
import SceneKit.ModelIO
import QuartzCore

class BadgeView: SCNView {
    let badge: Badge

    init(frame: CGRect = .zero, options: [String : Any]? = nil, badge: Badge) {
        self.badge = badge
        super.init(frame: frame, options: options)
        
        guard let badgeScene = SCNScene(named: badge.sceneName),
              let object = badgeScene.rootNode.childNode(withName: badge.objectName, recursively: true)
        else { return }
       
        let scnView = self
        scnView.scene = badgeScene
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        badgeScene.rootNode.addChildNode(cameraNode)
        cameraNode.position = SCNVector3(x:0, y:10, z:30)
        object.scale = SCNVector3(0.85, 0.85, 0.85)
        object.position = SCNVector3(0, 2, 0)
        scnView.allowsCameraControl = true
        scnView.autoenablesDefaultLighting = true
    

        
        
    
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLighting(for scene: SCNScene!) {
        // Create and add a light to the scene:
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.light?.color = UIColor.yellow
        lightNode.position = SCNVector3(x: 0, y: 30, z: 20)
        
        scene.rootNode.addChildNode(lightNode)
        // Create and add an ambient light to the scene:
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.brown
        scene.rootNode.addChildNode(ambientLightNode)
    }

  
}

