//
//  ViewController.swift
//  iOSTestOnboarding
//
//  Created by Konstantin Malyshev on 16.02.2020.
//  Copyright © 2020 Konstantin Malyshev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.backgroundColor = UIColor.init(red: 0/255, green: 87/255, blue: 75/255, alpha: 1.0)
        button.layer.cornerRadius = 30.0
        
        let vc = storyboard?.instantiateViewController(identifier: "Tutorial") as! OnboardingViewController
        self.navigationController?.pushViewController(vc, animated: false)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToFirstChild" {
            
        }
    }
}

