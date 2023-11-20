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
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: view.frame.size.width*2 , height: 0)
        view.addSubview(scrollView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        addChildVCs()
    }
    
    private func addChildVCs() {
        addChild(firstChildVC)
        addChild(secondChildVC)
        
        scrollView.addSubview(firstChildVC.view)
        scrollView.addSubview(secondChildVC.view)
        
        firstChildVC.view.frame = CGRect(x: 0, 
                                         y: 0,
                                         width: scrollView.frame.size.width,
                                         height: scrollView.frame.size.height)
        
        secondChildVC.view.frame = CGRect(x: scrollView.frame.size.width,
                                          y: 0,
                                          width: scrollView.frame.size.width,
                                          height: scrollView.frame.size.height)
        
        firstChildVC.didMove(toParent: self)
        secondChildVC.didMove(toParent: self)

    }
    

    @IBAction func didChangeSegmentControlValue( _ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            //first
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            //second
            scrollView.setContentOffset(CGPoint(x: view.frame.size.width, y: 0), animated: true)
        }
    }
}

