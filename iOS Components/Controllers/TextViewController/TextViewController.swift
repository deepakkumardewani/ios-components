//
//  TextViewController.swift
//  iOS Components
//
//  Created by Deepak Dewani on 03/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//

import UIKit

class TextViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var customTextView: UITextView!
    @IBOutlet weak var customTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.title = "Text View"
        setupTextField()
        setupTextView()
    }

    func setupTextField() {
        customTextField.delegate = self
        customTextField.placeholder = "Your input here.."
    }
    
    func setupTextView() {
        customTextView.delegate = self
    }
    
    
    //MARK: UITextView
    // Delegate Methods
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("text view did begin editing")
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        print("text view did end editing")
    }
    func textViewDidChange(_ textView: UITextView) {
        print("Text View Text: \(textView.text)")
    }
    
    //MARK: UITextField
    // Delegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TextField: \(textField.text)")
        textField.resignFirstResponder()
        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("clear button pressed")
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Text field begin editing")
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Text field end editing")
    }

}
