//
//  ViewController.swift
//  BE_UIKit
//
//  Created by 박지홍 on 2020/01/24.
//  Copyright © 2020 gred. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = Int(slider.value.rounded())
        startNewRound()
    }

    @IBAction func showAlert() {
        let message = "Your score is \(currentValue)" + "\n The targetValue is \(targetValue)"
        let alertController = UIAlertController(title: "Hello,swift!", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Good good.", style: .default, handler: nil)
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func showSliderValue (_ slider:UISlider) {
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabel() {
        targetLabel.text = String(targetValue)
    }
}

