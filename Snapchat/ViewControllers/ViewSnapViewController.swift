//
//  ViewSnapViewController.swift
//  Snapchat
//
//  Created by Dan Waseen on 1/26/18.
//  Copyright © 2018 RevWon. All rights reserved.
//

import UIKit
import SDWebImage
import FirebaseCore
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class ViewSnapViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = snap.descrip
        imageView.sd_setImage(with: URL(string : snap.imageURL))
    }
    override func viewWillDisappear(_ animated: Bool) {
       FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").child(snap.key).removeValue()
        
        FIRStorage.storage().reference().child("images").child("\(snap.uuid).jpg").delete { (error) in
            print("we deleted the pic")
        }
    }
}
