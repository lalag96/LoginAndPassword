//
//  SecondViewController.swift
//  LoginAndPassword
//
//  Created by  Влад on 30.05.2024.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var welcomeName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        welcomeLabel.text = "Welcome \(welcomeName ?? "")!"

    }
    
  
    @IBAction func logOufButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
