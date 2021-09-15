//
//  BadgeView.swift
//  Atletas
//
//  Created by Guilerme Barciki on 12/09/21.
//

import UIKit
import SceneKit
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
        cameraNode.position = SCNVector3(x:0, y:0, z:15)
        
        scnView.allowsCameraControl = true
        scnView.autoenablesDefaultLighting = true
        
        let medalGeometry = SCNCone(topRadius: 2, bottomRadius: 2, height: 0.1)
        medalGeometry.firstMaterial?.metalness.contents = UIColor.orange
        medalGeometry.firstMaterial?.diffuse.contents = UIColor.yellow
    
        let medalNode = SCNNode(geometry: medalGeometry)
        medalNode.scale = SCNVector3(3,3,3)
        medalNode.rotation = SCNVector4(1,1,1,2)
        
        scene.rootNode.addChildNode(medalNode)
       
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

