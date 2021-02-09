//
//  WelcomeViewController.swift
//  GolenovichAL_HW2.3
//
//  Created by Andrei Halianovich on 3.02.21.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var user: User?

    @IBOutlet var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = self.user else { return }
        welcomeLabel.text = "Welcome, \(user.person.fullName)!"
    }
}
