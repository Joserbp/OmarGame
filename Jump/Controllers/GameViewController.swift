//
//  GameViewController.swift
//  Jump
//
//  Created by Digis01 Soluciones Digitales on 29/10/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //print(PhysicsCategories.Player)
        //print(PhysicsCategories.Wall)
        //print(PhysicsCategories.Side)
        
        //UIFont.familyNames.forEach({
            //print($0)
        //})
        
        guard let view = self.view as? SKView else{
            return
        }
        let scene = GameScene(size: CGSize(width: screenWidth, height: 2048))
        scene.scaleMode = .aspectFill
        
        view.ignoresSiblingOrder = true
        view.showsFPS = true
        view.showsNodeCount = true
        view.showsPhysics = true
        scene.scaleMode = .aspectFill
        view.presentScene(scene)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
