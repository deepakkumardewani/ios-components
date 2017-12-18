//
//  CoreDataVC.swift
//  iOS Components
//
//  Created by Deepak Dewani on 08/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import UIKit
import CoreData
extension CoreDataVC {
    func saveData(item: String) {
        
        //reference to our app delegate
        let appDelegate : AppDelegate = delegate as! AppDelegate
        
        //reference managed object context
        let context : NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let entity =  NSEntityDescription.entity(forEntityName: "CoreDataEntity",
                                                 in:context)
        
        let newItem = CoreDataEntity(entity: entity!,
                                         insertInto: context)
        newItem.item = item
        
        do {
            try context.save()
        }
        catch let error as NSError {
            print(error)
        }
    }
    
    func retrieveData() {
        //reference to our app delegate
        let appDelegate : AppDelegate = delegate as! AppDelegate
        
        //reference managed object context
        let context : NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        //initialising the request
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreDataEntity")
        
        do {
            coreDataResults = try context.fetch(fetch) as? [CoreDataEntity]
            print("favourite results: \(coreDataResults?.count ?? 0)")
        }
        catch {
            let error = error as NSError
            print(error)
        }
        
    }
    
}

private let reuseIdentifier = "coreDataCell"

class CoreDataVC: UITableViewController {

    var itemArray: [String]?
    var coreDataResults: [CoreDataEntity]?
    let delegate = UIApplication.shared.delegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func setupUI() {
        // to remove extra table separator
        self.tableView.tableFooterView = UIView()
        
        coreDataResults = []
        retrieveData()

    }
    
    func updateUI() {
        if coreDataResults?.count == 0 {
            addDefaultLabel()
        }
        else {
            for view in view.subviews {
                if view.tag == 5 {
                    view.removeFromSuperview()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return coreDataResults?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        // Configure the cell...
        
        if let item = coreDataResults?.reversed()[indexPath.row] {
            cell.textLabel?.text = item.item
            cell.textLabel?.font(size: 20, type: .Default, family: .Default)
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
 
    @IBAction func addItem(_ sender: Any) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Add Item", message: "Enter a text", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            print("Text field: \(textField?.text ?? "")")
            
            self.saveData(item: textField!.text!)
            self.retrieveData()

            self.updateUI()
            
            // for adding new row to tableview
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
            self.tableView.endUpdates()
//            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (_) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    func addDefaultLabel() {
        let firstLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 50))

        firstLabel.center = tableView.center
        firstLabel.text = "No items yet."
        firstLabel.font(size: 40, type: .Bold, family: .Default)
        firstLabel.textAlignment = .center
        firstLabel.numberOfLines = 1
        firstLabel.tag = 5
        
        self.tableView.addSubview(firstLabel)
        
    }
    
}
