//
//  SnapsViewController.swift
//  Snapchat
//
//  Created by Dan Waseen on 1/23/18.
//  Copyright © 2018 RevWon. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func logoutTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}