//
//  PageController.swift
//  iOS Components
//
//  Created by Deepak Dewani on 07/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import UIKit

class PageController: UIViewController, UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController!
    var colors: [UIColor]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        colors = [UIColor.red, UIColor.yellow, UIColor.green]
        
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "pageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(index: 0)
        
        let viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRect(x: 0, y: 30, width: self.view.frame.width, height: self.view.frame.size.height - 60)
        
        self.addChildViewController(self.pageViewController)
        
        self.view.addSubview(self.pageViewController.view)
        
        self.pageViewController.didMove(toParentViewController: self)
    }
    
    func viewControllerAtIndex(index: Int) -> ContentVC {
        let contentVC: ContentVC = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentVC
        contentVC.backgroundColor = self.colors[index]
        contentVC.pageIndex = index
        return contentVC
    }
    
    
    // MARK: PageViewController DataSource
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! ContentVC
        var index = vc.pageIndex as Int
        index += 1
        if (index >= colors.count || index == NSNotFound) {
            return nil
        }
        
        return self.viewControllerAtIndex(index: index)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! ContentVC
        var index = vc.pageIndex as Int
        
        if (index <= 0 || index == NSNotFound) {
            return nil
        }
        index -= 1
        
        return self.viewControllerAtIndex(index: index)
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
