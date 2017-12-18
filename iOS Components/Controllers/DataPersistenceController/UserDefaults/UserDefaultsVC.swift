//
//  UserDefaultsVC.swift
//  iOS Components
//
//  Created by Deepak Dewani on 08/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import UIKit
import CoreData
extension UserDefaultsVC {
    func saveData(key: String, value: String) {
        
        //reference to our app delegate
        let appDelegate : AppDelegate = delegate as! AppDelegate
        
        //reference managed object context
        let context : NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let entity =  NSEntityDescription.entity(forEntityName: "UserDefaultsEntity",
                                                 in:context)
        
        let newItem = UserDefaultsEntity(entity: entity!,
                                         insertInto: context)
        newItem.key = key
        newItem.value = value
        
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
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "UserDefaultsEntity")
        
        do {
            userDefaultsResults = try context.fetch(fetch) as? [UserDefaultsEntity]
            print("favourite results: \(userDefaultsResults?.count ?? 0)")
        }
        catch {
            let error = error as NSError
            print(error)
        }
        
    }
    
    func checkForKey(key: String) -> Bool {
        //reference to our app delegate
        let appDelegate : AppDelegate = delegate as! AppDelegate
        
        //reference managed object context
        let context : NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        //initialising the request
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "UserDefaultsEntity")
        fetch.predicate = NSPredicate(format: "key == %@", key)
        
        do {
            userDefaultsResults = try context.fetch(fetch) as? [UserDefaultsEntity]
        }
        catch {
            let error = error as NSError
            print(error)
        }
        
        if userDefaultsResults?.count == 0 {
            return false
        }
        else {
            return true
        }
        
    }
    
}
private let reuseIdentifier = "userDefaultsCell"

class UserDefaultsVC: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var keyTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var resultLabel: BaseLabel!
    @IBOutlet weak var submitButton: BaseButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputKey: UITextField!
    @IBOutlet weak var loadButton: BaseButton!
    
    // 1. creating a defaults variable to access the UserDefaults class
    let defaults = UserDefaults()
    let delegate = UIApplication.shared.delegate
    
    var userDefaultsResults: [UserDefaultsEntity]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    func setupUI() {
        userDefaultsResults = []
        retrieveData()
        
        // to remove extra table separator
        self.tableView.tableFooterView = UIView()
        
        self.tableView.reloadData()
        
        resultLabel.text = "Nothing here, yet."
        
        submitButton.layer.cornerRadius = 10
        submitButton.layer.borderColor = UIColor.red.cgColor
        submitButton.layer.borderWidth = 1
        submitButton.tintColor = UIColor.red
        
        loadButton.layer.cornerRadius = 10
        loadButton.layer.borderColor = UIColor.red.cgColor
        loadButton.layer.borderWidth = 1
        loadButton.tintColor = UIColor.red
    }
    
    @IBAction func submitAction(_ sender: Any) {
        
        if keyTextField.text!.isEmpty || valueTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Error!", message: "Enter a key/value pair", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                self.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if checkForKey(key: keyTextField.text!) {
                let alert = UIAlertController(title: "Error!", message: "This key already exists. Please enter a different key", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                    self.dismiss(animated: true, completion: nil)
                }))
                
                self.present(alert, animated: true, completion: nil)
            }
            else {
                defaults.set(valueTextField.text!, forKey: keyTextField.text!)
                
                saveData(key: keyTextField.text!, value: valueTextField.text!)
                retrieveData()
                
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: [IndexPath(row: 1, section: 0)], with: .automatic)
                self.tableView.endUpdates()
            }
     
            
        }
    }
    
    @IBAction func loadAction(_ sender: Any) {
        
        retrieveData()
        
        if userDefaultsResults?.count == 0 {
            let alert = UIAlertController(title: "Error!", message: "Add a key/value pair first", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                self.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if inputKey.text!.isEmpty {
                let alert = UIAlertController(title: "Error!", message: "Enter the input-key to load the value", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                    self.dismiss(animated: true, completion: nil)
                }))
                
                self.present(alert, animated: true, completion: nil)
            }
            else {
                if checkForKey(key: inputKey.text!) {
                    resultLabel.text = defaults.value(forKey: inputKey.text!) as? String ?? "Nothing here, yet."
                }
                else {
                    let alert = UIAlertController(title: "Error!", message: "No value exist for the given key", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                        self.dismiss(animated: true, completion: nil)
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
            
        }
        
    }
    
    //MARK: UITableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDefaultsResults!.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "Key"
            cell.detailTextLabel?.text = "Value"
            cell.textLabel?.font(size: 20, type: .Bold, family: .Default)
            cell.detailTextLabel?.font(size: 20, type: .Bold, family: .Default)
        }
        else {
            if let item = userDefaultsResults?.reversed()[indexPath.row - 1] {
                cell.textLabel?.text = item.key
                cell.detailTextLabel?.text = item.value
                cell.textLabel?.font(size: 18, type: .Default, family: .Default)
                cell.detailTextLabel?.font(size: 18, type: .Default, family: .Default)
            }
        }
        
        return cell
    }
}














