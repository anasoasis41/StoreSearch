//
//  DetailViewController.swift
//  StoreSearch
//
//  Created by MAC-Anas on 8/20/19.
//  Copyright © 2019 Anas Riahi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // load viewController from the storyBoard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension DetailViewController: UIViewControllerTransitioningDelegate {
    /**
     This delegate protocol tell UIKit what objects it should use to perform the transition
     to the Detail View Controller
     */
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController {
        return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
