//
//  MoreInfoViewController.swift
//  GolenovichAL_HW2.3
//
//  Created by Andrei Halianovich on 8.02.21.
//

import UIKit

class MoreInfoViewController: UIViewController {
    
    var user: User?

    @IBOutlet var aboutMeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let user = user else { return }
        aboutMeLabel.text = user.person.interestingFact
    }
}
