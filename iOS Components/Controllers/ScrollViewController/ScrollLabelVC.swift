//
//  ScrollLabelVC.swift
//  iOS Components
//
//  Created by Deepak Dewani on 07/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import UIKit

class ScrollLabelVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var customLabel: UILabel!
    @IBOutlet weak var customScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupScrollView()
        
    }
    
    func setupUI() {
        customLabel.text = "This is a particular case of using the UIScrollView with the UILabel. This can be done in another way as well as you will see in the second tab.\n\nWhy do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\n\n\n\nWhy do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\n\n\n\nWhy do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\n\n\n\nWhy do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\n\n\n"
    }
    
    func setupScrollView() {
        customScrollView.delegate = self
        
        //getting height of label
        let labelSize = customLabel.text?.height(withConstrainedWidth: customLabel.frame.width, font: UIFont(name: "HelveticaNeue", size: 20)!)
        customScrollView.contentSize = CGSize(width: self.view.frame.size.width, height: labelSize!)
    }
    
    
    //Delegate methods
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scroll view did scroll")
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print("scroll view did scroll to top")
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scroll view did begin dragging")
    }
    
    


}
