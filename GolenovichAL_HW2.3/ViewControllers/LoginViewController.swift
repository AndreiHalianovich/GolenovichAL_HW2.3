//
//  ViewController.swift
//  GolenovichAL_HW2.3
//
//  Created by Andrei Halianovich on 3.02.21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = User.getUser()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tabBarController = segue.destination as! UITabBarController
        let viewControllers = tabBarController.viewControllers!
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let profileVC = viewController as? ProfileViewController {
                profileVC.user = user
            } else if let moreInfoVC = viewController as? MoreInfoViewController {
                moreInfoVC.user = user
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    
    @IBAction func logInButtonDidClick() {
        tryToLogin()
    }
    
    @IBAction func forgotUserNameButtonDidClick() {
        showAlert(with: "Ooops", and: "Your Name is \(user.userName) 🤔")
    }
    
    @IBAction func forgotUserPasswordDidCLick() {
        showAlert(with: "Ooops", and: "Your password is \(user.password) 🤔")
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
}

// MARK: - Alert controller
extension LoginViewController {
    private func tryToLogin() {
        if userNameTextField.text == user.userName && passwordTextField.text == user.password {
            performSegue(withIdentifier: "showWelcome", sender: nil)
        } else {
            showAlert(with: "Invalid login or password", and: "Please, enter correct login or password")
        }
    }
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = nil
        }
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}

// MARK: - Work with keyboard
extension LoginViewController: UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            tryToLogin()
        }
        return true
    }
}
