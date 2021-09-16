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

    override init(frame: CGRect, options: [String : Any]? = nil) {
        super.init(frame: frame, options: options)
        let scene = SCNScene()
       
        let scnView = self
        scnView.scene = scene
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        cameraNode.position = SCNVector3(x:0, y:0, z:20)
        
        scnView.allowsCameraControl = true
        scnView.autoenablesDefaultLighting = true
        
        guard let badgeScene = SCNScene(named: "3dModels.scnassets/badge-ouro/badge-ouro.scn"),
              let object = badgeScene.rootNode.childNode(withName: "badge-ouro", recursively: true)
        else { return }
        
        object.pivot = SCNMatrix4MakeTranslation(0, 10, 0)
        scene.rootNode.addChildNode(object)
        
    
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

