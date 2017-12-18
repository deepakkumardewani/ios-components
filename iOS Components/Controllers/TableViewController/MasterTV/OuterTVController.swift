//
//  MasterTVController.swift
//  iOS Components
//
//  Created by Deepak Dewani on 03/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import UIKit

private let reuseIdentifier = "outerTVCell"

class OuterTVController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        self.title = "OuterTV"
        
        // for setting height of rows automatically based on content of the cell
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    /*========================================================================================*/
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! OuterTVCell
        
        cell.textLabel?.font(size: 20, type: .Bold, family: .Default)
        
        if indexPath.section == 0 {
            cell.outerLabel?.text = "1. Static Table View with Custom Cell Style"
//            cell.backgroundColor = .yellow
            cell.outerLabel?.textColor = .black
            
        }
        else if indexPath.section == 1 {
            cell.outerLabel?.text = "2. Dynamic Table View with Custom Cell Style"
//            cell.backgroundColor = .orange
            cell.outerLabel?.textColor = .black
        }
        else {
            cell.outerLabel?.text = ""
            cell.backgroundColor = .clear
            cell.outerLabel?.textColor = .black
        }

        return cell
    }
    /*========================================================================================*/
    
    
    /*========================================================================================*/
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        if indexPath.section == 0 && indexPath.row == 0 {
            let staticTV = mainStoryboard.instantiateViewController(withIdentifier: "staticTVController") as? StaticTVController
            self.navigationController?.pushViewController(staticTV!, animated: true)
        }
        else if indexPath.section == 1 && indexPath.row == 0 {
            let dynamicTV = mainStoryboard.instantiateViewController(withIdentifier: "dynamicTVController") as? DynamicTVController
            self.navigationController?.pushViewController(dynamicTV!, animated: true)
        }
    }
    /*========================================================================================*/
    
    
    /*========================================================================================*/
    //MARK: UITableViewAutomaticDimension
    // methods for setting height of rows automatically based on content of the cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    /*========================================================================================*/
    

 

}
