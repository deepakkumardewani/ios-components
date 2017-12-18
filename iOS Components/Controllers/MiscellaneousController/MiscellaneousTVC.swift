//
//  MiscellaneousTVC.swift
//  iOS Components
//
//  Created by Deepak Dewani on 09/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import UIKit

private let reuseIdentifier = "miscellaneousCell"

class MiscellaneousTVC: UITableViewController {

    let helper = HelperClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.title = "Miscellaneous"
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return helper.miscellaneousControllers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = "\(indexPath.row + 1). \(helper.miscellaneousControllers[indexPath.row])"
        cell.textLabel?.font(size: 20, type: .Bold, family: .Default)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        // instantiating view controllers based on index
        if indexPath.row == 0 {
            let lifeCycle = mainStoryboard.instantiateViewController(withIdentifier: "firstVC") as? FirstViewController
            self.navigationController?.pushViewController(lifeCycle!, animated: true)
        }
        else if indexPath.row == 1 {
            let firstViewController = mainStoryboard.instantiateViewController(withIdentifier: "viewControllerOne") as? ViewControllerOne
            self.navigationController?.pushViewController(firstViewController!, animated: true)
        }
        else if indexPath.row == 2 {
            let secondViewController = mainStoryboard.instantiateViewController(withIdentifier: "viewControllerTwo") as? ViewControllerTwo
            self.navigationController?.pushViewController(secondViewController!, animated: true)
        }
        else if indexPath.row == 3 {
            let thirdViewController = mainStoryboard.instantiateViewController(withIdentifier: "viewControllerThree") as? ViewControllerThree
            self.navigationController?.pushViewController(thirdViewController!, animated: true)
        }
        else if indexPath.row == 4 {
            let alert = UIAlertController(title: "Coming Soon!", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else if indexPath.row == 5 {
            let fifthViewController = mainStoryboard.instantiateViewController(withIdentifier: "viewControllerFive") as? ViewControllerFive
            self.navigationController?.pushViewController(fifthViewController!, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
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
