/*
* Copyright (c) 2014 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import SceneKit

class ViewController: UIViewController {
  // UI
  @IBOutlet weak var sceneView: SCNView!
  
  // MARK: Lifecycle
  override func viewDidLoad() {
      super.viewDidLoad()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    sceneSetup()
  }
    
    func sceneSetup() {
        let scene = SCNScene()
        
        let materialFace = SCNMaterial()
        materialFace.diffuse.contents = UIImage(named: "Face")
        
        let materialLeft = SCNMaterial()
        materialLeft.diffuse.contents = UIImage(named: "Gauche")
        
        let materialRight = SCNMaterial()
        materialRight.diffuse.contents = UIImage(named: "Droite")
        
        let materialTop = SCNMaterial()
        materialTop.diffuse.contents = UIImage(named: "Dessus")
        
        let materialBottom = SCNMaterial()
        materialBottom.diffuse.contents = UIImage(named: "Dessous")
        
        let materialRear = SCNMaterial()
        materialRear.diffuse.contents = UIImage(named: "Arriere")
        
        let boxGeometry = SCNBox(width: 10.0, height: 10.0, length: 10.0, chamferRadius: 0.0)
        boxGeometry.materials = [materialFace, materialRight, materialRear, materialLeft, materialTop, materialBottom]
        
        let boxNode = SCNNode(geometry: boxGeometry)
        scene.rootNode.addChildNode(boxNode)
        
        sceneView.scene = scene
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
    }
  
  // MARK: Style
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  // MARK: Transition
  override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    sceneView.stop(nil)
    sceneView.play(nil)
  }
}
