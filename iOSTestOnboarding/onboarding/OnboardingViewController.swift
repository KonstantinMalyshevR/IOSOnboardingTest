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
    private var index: Int = 0
    
    private var pageViewController: PageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.layer.cornerRadius = 30
        leftButton.layer.cornerRadius = 30
        rightButton.layer.cornerRadius = 30
    }
    
    @IBAction func rightButtonTap(_ sender: Any) {
        pageViewController?.pageForward()
    }
    
    @IBAction func leftButtonTap(_ sender: Any) {
        pageViewController?.pagePrevious()
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
            
            pageViewController?.callback = { [weak self] index in
                self?.index = index
                self?.pageControl.currentPage = index
                switch index {
                case 0:
                    self?.leftButton.isHidden = true
                    self?.rightButton.isHidden = false
                    self?.startButton.isHidden = true
                case 3:
                    self?.leftButton.isHidden = false
                    self?.rightButton.isHidden = true
                    self?.startButton.isHidden = false
                default:
                    self?.leftButton.isHidden = false
                    self?.rightButton.isHidden = false
                    self?.startButton.isHidden = true
                }
            }
        }
    }

}
