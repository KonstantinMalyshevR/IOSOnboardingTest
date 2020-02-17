//
//  OnboardingViewController.swift
//  iOSTestOnboarding
//
//  Created by Konstantin Malyshev on 16.02.2020.
//  Copyright © 2020 Konstantin Malyshev. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    private var pageViewController: PageViewController?
    private var index: Int! {
        didSet {
            pageControl.currentPage = index
            switch index {
            case 0:
                leftButton.isHidden = true
                rightButton.isHidden = false
                startButton.isHidden = true
            case 3:
                leftButton.isHidden = false
                rightButton.isHidden = true
                startButton.isHidden = false
            default:
                leftButton.isHidden = false
                rightButton.isHidden = false
                startButton.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        index = 0
        startButton.layer.cornerRadius = 30
        leftButton.layer.cornerRadius = 30
        rightButton.layer.cornerRadius = 30
        
        pageViewController?.callback = { [weak self] index in
            self?.index = index
        }
    }
    
    @IBAction func rightButtonTap(_ sender: Any) {
        pageViewController?.pageForward()
        index = index + 1
    }
    
    @IBAction func leftButtonTap(_ sender: Any) {
        pageViewController?.pagePrevious()
        index = index - 1
    }
    
    @IBAction func startButtonTap(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func closeButtonTap(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToFirstChild" {
            pageViewController = segue.destination as? PageViewController
        }
    }

}
