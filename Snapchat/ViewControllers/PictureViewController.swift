//
//  PictureViewController.swift
//  Snapchat
//
//  Created by Dan Waseen on 1/23/18.
//  Copyright © 2018 RevWon. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseStorage

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        
        nextButton.isEnabled = false
        
        let imagesFolder = FIRStorage.storage().reference().child("images")
        
        let  imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)!
        
        imagesFolder.child("\(NSUUID().uuidString).jpg").put(imageData, metadata: nil, completion: {(metadata, error) in
            
            print("We tried to upload")
            
            if error != nil{
                print("we had error: \(error!)")
            }else{
                self.performSegue(withIdentifier: "selectUserSeque", sender: nil)
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
    }
    
}
