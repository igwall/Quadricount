//
//  AddTravelViewController.swift
//  Quadricount_App
//
//  Created by Thomas Falcone on 25/03/2019.
//  Copyright © 2019 Polytech Montpellier. All rights reserved.
//

import Foundation
import UIKit

class AddTravelViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var newTravel : Travel?
    let imagePicker = UIImagePickerController()
    
    @IBAction func chooseImageButton(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTravel" {
            guard let name = nameLabel.text else { return }
            self.newTravel = Travel(name: name, picture: (imageView.image ?? nil) ?? nil)
        }
    }
    
    // MARK ImagePicker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.contentMode = .scaleAspectFit
            self.imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
