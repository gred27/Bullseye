//
//  HighScoreViewController.swift
//  BE_UIKit
//
//  Created by 박지홍 on 2020/03/05.
//  Copyright © 2020 gred. All rights reserved.
//

import UIKit

class HighScoreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension HighScoreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "HighScoreItem",
            for: indexPath)
        // Add the following code
        let nameLabel = cell.viewWithTag(1000) as! UILabel
        let scoreLabel = cell.viewWithTag(2000) as! UILabel
        
        if indexPath.row == 0 {
            nameLabel.text = "The reader of this book"
            scoreLabel.text = "50000"
        } else if indexPath.row == 1 {
            nameLabel.text = "Manda"
            scoreLabel.text = "10000"
        } else if indexPath.row == 2 {
            nameLabel.text = "Joey"
            scoreLabel.text = "5000"
        } else if indexPath.row == 3 {
            nameLabel.text = "Adam"
            scoreLabel.text = "1000"
        } else if indexPath.row == 4 {
            nameLabel.text = "Eli"
            scoreLabel.text = "500" }
        return cell
    }
}

extension HighScoreViewController: UITableViewDelegate {
    
}
