//
//  ViewController.swift
//  MyChildControllers
//
//  Created by Apurva Jalgaonkar on 03/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var firstChildVC = FirstChildViewController()
    private lazy var secondChildVC = SecondChildViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVCs()
    }
    
    private func addChildVCs() {
        addChild(firstChildVC)
        addChild(secondChildVC)
        
        view.addSubview(firstChildVC.view)
        view.addSubview(secondChildVC.view)
        
        firstChildVC.view.frame = CGRect(x: 0, 
                                         y: 0,
                                         width: view.frame.size.width,
                                         height: view.frame.size.height)
        secondChildVC.view.frame = CGRect(x: 0,
                                          y: view.frame.size.height/3,
                                          width: view.frame.size.width,
                                          height: (view.frame.size.height/3)*2)
        
        
        firstChildVC.didMove(toParent: self)
        secondChildVC.didMove(toParent: self)

    }
}

