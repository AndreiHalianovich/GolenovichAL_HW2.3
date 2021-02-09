//
//  ProfileViewController.swift
//  GolenovichAL_HW2.3
//
//  Created by Andrei Halianovich on 8.02.21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var user: User?
    
    @IBOutlet var profilePhoto: UIImageView!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var secondNameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var countryLivingLabel: UILabel!
    @IBOutlet var professionLabel: UILabel!
    @IBOutlet var favoriteColorLabel: UILabel!
    @IBOutlet var favoriteFoodLabel: UILabel!
    @IBOutlet var hobbyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let user = user else { return }
        let person = user.person
        
        profilePhoto.image = UIImage(named: person.photoName)
        firstNameLabel.text = person.firstName
        secondNameLabel.text = person.secondName
        ageLabel.text = String(person.age)
        heightLabel.text = String(person.height)
        weightLabel.text = String(person.weight)
        countryLivingLabel.text = person.countryLiving
        professionLabel.text = person.profession
        favoriteColorLabel.text = person.favoriteColor.rawValue
        favoriteFoodLabel.text = person.favoriteFood
        hobbyLabel.text = person.hobby
    }
}
