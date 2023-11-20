//
//  ViewController.swift
//  ChildControllerAssignment
//
//  Created by Apurva Jalgaonkar on 04/11/23.
//

import UIKit

class ViewController: UIViewController {

    private lazy var FirstChildVC = FirstViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
    }


    @IBAction func enterButtonPressed(_ sender: UIButton) {
        addChildVC()
    }
    
    
    @IBAction func returnButtonPressed(_ sender: UIButton) {
        removeChildVC()
    }
    
    private func addChildVC() {
        
        addChild(FirstChildVC)
        view.addSubview(FirstChildVC.view)
        FirstChildVC.view.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: view.frame.size.height)
        FirstChildVC.didMove(toParent: self)
    }
    
    private func removeChildVC() {
        
        FirstChildVC.willMove(toParent: nil)
        FirstChildVC.view.removeFromSuperview()
        FirstChildVC.removeFromParent()
    }
}

