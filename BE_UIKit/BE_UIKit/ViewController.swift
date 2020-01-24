//
//  ViewController.swift
//  BE_UIKit
//
//  Created by 박지홍 on 2020/01/24.
//  Copyright © 2020 gred. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert() {
        let alertController = UIAlertController(title: "Hello,swift!", message: "This is a button", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Good good.", style: .default, handler: nil)
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
        print("hello")
    }
}

