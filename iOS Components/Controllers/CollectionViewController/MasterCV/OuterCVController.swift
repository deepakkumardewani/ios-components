//
//  MasterCVController.swift
//  iOS Components
//
//  Created by Deepak Dewani on 03/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import UIKit

private let reuseIdentifier = "outerCVCell"

class OuterCVController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let imageArray = [UIImage(named: "horizontal"), UIImage(named: "vertical")]
    let textArray = ["Horizontal", "Vertical"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.title = "OuterCV"
        self.collectionView?.delegate = self
        self.collectionView?.reloadData()
        self.collectionView?.reloadItems(at: (collectionView?.indexPathsForVisibleItems)!)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 2
    }
    
    //MARK: UICollectionViewDelegate
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//        let screenRect = UIScreen.main.bounds
//        let screenWidth = screenRect.size.width
//        let screenHeight = screenRect.size.height
//        let cellWidth = screenWidth / 2
//        let cellHeight = screenHeight / 2
//        let size = CGSize(width: cellWidth, height: cellHeight)
//        
//        return size
//    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! OuterCVCell
    
        // Configure the cell
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.outerImage.image = imageArray[indexPath.row]
        cell.outerLabel.text = textArray[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        if indexPath.row == 1 {
            let staticTV = mainStoryboard.instantiateViewController(withIdentifier: "verticalCVController") as? VerticalCVController
            self.navigationController?.pushViewController(staticTV!, animated: true)
        }
        else if indexPath.row == 0 {
            let dynamicTV = mainStoryboard.instantiateViewController(withIdentifier: "horizontalCVController") as? HorizontalCVController
            self.navigationController?.pushViewController(dynamicTV!, animated: true)
        }
    }


}
