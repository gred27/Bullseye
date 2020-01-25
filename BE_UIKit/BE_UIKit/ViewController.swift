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
    var score = 0
    var currentRound = 1
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = Int(slider.value.rounded())
        startNewRound()
    }

    @IBAction func showAlert() {
        let difference = abs(currentValue-targetValue)()
        var currentScore = 100 - difference
        
        
        let title: String
        if difference == 0 {
            title = "Perfect"
            currentScore += 100
        } else if difference < 5 {
            title = "You almost had it!"
            currentScore += 50
        } else if difference < 10 {
            title = "Pretty good!"
            currentScore += 10
        } else {
            title = "Not even close...."
        }
        
        score += currentScore
        let message = "You scored \(currentScore) points!"
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
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
        currentRound += 1
        
        updateLabel()
    }
    
    func updateLabel() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(currentRound)
    }
    
}

