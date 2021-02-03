//
//  WelcomeViewController.swift
//  GolenovichAL_HW2.3
//
//  Created by Andrei Halianovich on 3.02.21.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var userName: String?

    @IBOutlet var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let userName = self.userName else { return }
        welcomeLabel.text = "Welcome, \(userName)!"
    }
}
