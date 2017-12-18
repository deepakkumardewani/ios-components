//
//  MasterTVC.swift
//  iOS Components
//
//  Created by Deepak Dewani on 03/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import UIKit

private let reuseIdentifier = "masterCell"

class MasterTVC: UITableViewController {
    
    let helper = HelperClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    func setupUI() {
        self.title = "MasterTV"
        // to remove extra table separator
        //        self.tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return helper.viewControllers.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(indexPath.row + 1). \(helper.viewControllers[indexPath.row])"
        cell.textLabel?.font(size: 20, type: .Bold, family: .Default)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        // instantiating view controllers based on index
        if indexPath.row == 0 {
            let outerTV = mainStoryboard.instantiateViewController(withIdentifier: "outerTVController") as? OuterTVController
            self.navigationController?.pushViewController(outerTV!, animated: true)
        }
        else if indexPath.row == 1 {
            let outerCV = mainStoryboard.instantiateViewController(withIdentifier: "outerCVController") as? OuterCVController
            self.navigationController?.pushViewController(outerCV!, animated: true)
        }
        else if indexPath.row == 2 {
            let tabBar = mainStoryboard.instantiateViewController(withIdentifier: "tabBarVC") as? TabBarViewController
            self.navigationController?.pushViewController(tabBar!, animated: true)
        }
        else if indexPath.row == 3 {
            let picker = mainStoryboard.instantiateViewController(withIdentifier: "pickerVC") as? PickerViewController
            self.navigationController?.pushViewController(picker!, animated: true)
        }
        else if indexPath.row == 4 {
            let textVC = mainStoryboard.instantiateViewController(withIdentifier: "textVC") as? TextViewController
            self.navigationController?.pushViewController(textVC!, animated: true)
        }
        else if indexPath.row == 5 {
            let scrollVC = mainStoryboard.instantiateViewController(withIdentifier: "scrollVC") as? ScrollViewController
            self.navigationController?.pushViewController(scrollVC!, animated: true)
        }
        else if indexPath.row == 6 {
            let pageVC = mainStoryboard.instantiateViewController(withIdentifier: "pageVC") as? PageController
            self.navigationController?.pushViewController(pageVC!, animated: true)
        }
        else if indexPath.row == 7 {
            let webkitVC = mainStoryboard.instantiateViewController(withIdentifier: "webKitVC") as? WebktViewController
            self.navigationController?.pushViewController(webkitVC!, animated: true)
        }
        else if indexPath.row == 8 {
            let dataPersistence = mainStoryboard.instantiateViewController(withIdentifier: "dataPersistenceVC") as? DataPersistenceVC
            self.navigationController?.pushViewController(dataPersistence!, animated: true)
        }
        else if indexPath.row == 9 {
            let miscellaneous = mainStoryboard.instantiateViewController(withIdentifier: "miscellaneousVC") as? MiscellaneousTVC
            self.navigationController?.pushViewController(miscellaneous!, animated: true)
        }
    }

}
