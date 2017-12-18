//
//  ViewControllerThree.swift
//  iOS Components
//
//  Created by Deepak Dewani on 17/12/17.
//  Copyright © 2017 Deepak Kumar Dewani. All rights reserved.
//


import UIKit

class ViewControllerThree: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var pickButtonOutlet: UIButton!
    @IBOutlet weak var contentModeSegment: UISegmentedControl!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        picker.delegate = self
        // customising UIImage
        imageViewOutlet.layer.borderWidth = 1
        imageViewOutlet.layer.borderColor = UIColor.gray.cgColor
        imageViewOutlet.contentMode = .scaleToFill
        
        // customising UIButton
        pickButtonOutlet.layer.cornerRadius = 10
        pickButtonOutlet.layer.borderColor = UIColor.red.cgColor
        pickButtonOutlet.layer.borderWidth = 1
        pickButtonOutlet.backgroundColor = .clear
        pickButtonOutlet.tintColor = .red
        
        // customising UISegmentedControl
        contentModeSegment.tintColor = .red
        contentModeSegment.selectedSegmentIndex = 0
    }
    
    @IBAction func pickImageFunction(_ sender: Any) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary // or you can select 'camera' or 'savedPhotosAlbum' if you're using a real device
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func contentModeAction(_ sender: Any) {
        switch contentModeSegment.selectedSegmentIndex {
        case 0:
            imageViewOutlet.contentMode = .scaleToFill
        case 1:
            imageViewOutlet.contentMode = .scaleAspectFit
        case 2:
            imageViewOutlet.contentMode = .scaleAspectFill
        default:
            imageViewOutlet.contentMode = .scaleToFill
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageViewOutlet.contentMode = .scaleAspectFit
        imageViewOutlet.image = chosenImage
        dismiss(animated:true, completion: nil)
    }
    //MARK: - Delegates
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    
}
