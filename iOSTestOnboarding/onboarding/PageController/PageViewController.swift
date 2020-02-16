//
//  PageViewController.swift
//  iOSTestOnboarding
//
//  Created by Konstantin Malyshev on 16.02.2020.
//  Copyright © 2020 Konstantin Malyshev. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    private var texts: [String] = ["Длинный текст инструкции номер 1, Длинный текст инструкции номер 1, Длинный текст инструкции номер 1",
                                   "Длинный текст инструкции номер 2, Длинный текст инструкции номер 2, Длинный текст инструкции номер 2",
                                   "Длинный текст инструкции номер 3, Длинный текст инструкции номер 3, Длинный текст инструкции номер 3",
                                   "Длинный текст инструкции номер 4, Длинный текст инструкции номер 4, Длинный текст инструкции номер 4"]
    private var images: [String] = ["Image1", "Image2", "Image3", "Image4"]
    
    var callback: ((Int)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        if let vc = self.pageViewController(for: 0) {
            setViewControllers([vc], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageForward() {
        goToNextPage()
    }
    
    func pagePrevious() {
        goToPreviousPage()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? PageItemController)?.index ?? 0) - 1
        return self.pageViewController(for: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? PageItemController)?.index ?? 0) + 1
        return self.pageViewController(for: index)
    }
    
    func pageViewController(for index: Int) -> PageItemController? {
        guard index >= 0, index < texts.count else {
            return nil
        }
        
        let vc = storyboard?.instantiateViewController(identifier: "PageItem") as! PageItemController
        vc.text = texts[index]
        vc.image = images[index]
        vc.index = index
        callback?(index)
        return vc
    }
}

extension UIPageViewController {
    func goToNextPage(animated: Bool = true) {
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) else { return }
        setViewControllers([nextViewController], direction: .forward, animated: animated, completion: nil)
    }

    func goToPreviousPage(animated: Bool = true) {
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let previousViewController = dataSource?.pageViewController(self, viewControllerBefore: currentViewController) else { return }
        setViewControllers([previousViewController], direction: .reverse, animated: animated, completion: nil)
    }
}
