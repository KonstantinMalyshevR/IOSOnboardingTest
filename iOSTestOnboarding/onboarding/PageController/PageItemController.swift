//
//  PageItemController.swift
//  iOSTestOnboarding
//
//  Created by Konstantin Malyshev on 16.02.2020.
//  Copyright © 2020 Konstantin Malyshev. All rights reserved.
//

import UIKit

class PageItemController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var pictureImage: UIImageView!
    var index: Int = 0
    var text: String = ""
    var image: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = text
        pictureImage.image = UIImage(named: image)
    }
    
}
