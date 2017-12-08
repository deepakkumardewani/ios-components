//
//  StaticCVController.swift
//  iOS Components
//
//  Created by Deepak Dewani on 03/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import UIKit

private let reuseIdentifier = "verticalCVCell"

class VerticalCVController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //    let numberArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 100
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! VerticalCVCell
        
        // Configure the cell
        cell.verticalLabel.text = String(indexPath.row + 1)
        cell.verticalLabel.font(size: 50, type: .Bold, family: .Default)
        cell.layer.cornerRadius = 10
        cell.backgroundColor = UIColor.hexStringToUIColor(hex: "#BCDEFA")
        cell.verticalLabel.textColor = UIColor.hexStringToUIColor(hex: "#2278CF")
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let screenRect = UIScreen.main.bounds
//        let screenWidth = screenRect.size.width
//        let screenHeight = screenRect.size.height
//        let cellWidth = screenWidth / 2
//        let cellHeight = screenHeight / 2
        let size = CGSize(width: 200, height: 200)
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func setupUI() {
        self.title = "VerticalCV"
        self.collectionView?.delegate = self
        self.collectionView?.reloadData()
        self.collectionView?.reloadItems(at: (collectionView?.indexPathsForVisibleItems)!)
    }
}
