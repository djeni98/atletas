//
//  MedalComponent.swift
//  Atletas
//
//  Created by Guilerme Barciki on 12/09/21.
//

import Foundation

import UIKit
import QuartzCore
import SceneKit

class MedalComponent : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        self.view = SCNView()
        let scnView = self.view as! SCNView
        scnView.scene = scene
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        cameraNode.position = SCNVector3(x:0, y:0, z:15)
        
        scnView.allowsCameraControl = true
        scnView.autoenablesDefaultLighting = true
        
        let medalGeometry = SCNCone(topRadius: 2, bottomRadius: 2, height: 0.1)
        let medalNode = SCNNode(geometry: medalGeometry)
        medalNode.rotation = SCNVector4(1,1,1,2)
        scene.rootNode.addChildNode(medalNode)
        view.backgroundColor = .black
        
        
    }
}
