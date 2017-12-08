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

    let helper = Helper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
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
        cell.textLabel?.text = helper.viewControllers[indexPath.row]
        cell.textLabel?.font(size: 20, type: .Bold, family: .Default)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        if indexPath.row == 0 {
            let navigation = mainStoryboard.instantiateViewController(withIdentifier: "navigationController") as? NavigationView
            self.navigationController?.pushViewController(navigation!, animated: true)
        }
        else if indexPath.row == 1 {
            let basic = mainStoryboard.instantiateViewController(withIdentifier: "basicVC") as? BasicViewController
            self.navigationController?.pushViewController(basic!, animated: true)
        }
        else if indexPath.row == 2 {
            let outerTV = mainStoryboard.instantiateViewController(withIdentifier: "outerTVController") as? OuterTVController
            self.navigationController?.pushViewController(outerTV!, animated: true)
        }
        else if indexPath.row == 3 {
            let outerCV = mainStoryboard.instantiateViewController(withIdentifier: "outerCVController") as? OuterCVController
            self.navigationController?.pushViewController(outerCV!, animated: true)
        }
        else if indexPath.row == 4 {
            let tabBar = mainStoryboard.instantiateViewController(withIdentifier: "tabBarVC") as? TabBarViewController
            self.navigationController?.pushViewController(tabBar!, animated: true)
        }
        else if indexPath.row == 5 {
            let picker = mainStoryboard.instantiateViewController(withIdentifier: "pickerVC") as? PickerViewController
            self.navigationController?.pushViewController(picker!, animated: true)
        }
        else if indexPath.row == 6 {
            let textVC = mainStoryboard.instantiateViewController(withIdentifier: "textVC") as? TextViewController
            self.navigationController?.pushViewController(textVC!, animated: true)
        }
        else if indexPath.row == 7 {
            let scrollVC = mainStoryboard.instantiateViewController(withIdentifier: "scrollVC") as? ScrollViewController
            self.navigationController?.pushViewController(scrollVC!, animated: true)
        }
        else if indexPath.row == 8 {
            let pageVC = mainStoryboard.instantiateViewController(withIdentifier: "pageVC") as? PageController
            self.navigationController?.pushViewController(pageVC!, animated: true)
        }
        else if indexPath.row == 9 {
            let webkitVC = mainStoryboard.instantiateViewController(withIdentifier: "webKitVC") as? WebktViewController
            self.navigationController?.pushViewController(webkitVC!, animated: true)
        }
    }
 
    func setupUI() {
        
        self.title = "MasterTV"
        // to remove extra table separator
//        self.tableView.tableFooterView = UIView()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
