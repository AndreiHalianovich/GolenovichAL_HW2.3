//
//  ViewController.swift
//  GolenovichAL_HW2.3
//
//  Created by Andrei Halianovich on 3.02.21.
//

import UIKit

class LoginViewController: UIViewController {
    
    let userName = "User"
    let password = "Password"
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    @IBAction func logInButtonDidClick() {
        tryToLogin()
    }
    
    @IBAction func forgotUserNameButtonDidClick() {
        showAlert(with: "Ooops", and: "Your Name is \(userName) 🤔")
    }
    
    @IBAction func forgotUserPasswordDidCLick() {
        showAlert(with: "Ooops", and: "Your password is \(password) 🤔")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTextField.text
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

// Mark: - Alert controller
extension LoginViewController: UITextFieldDelegate{
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = nil
        }
        
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
    private func tryToLogin() {
        if userNameTextField.text == userName && passwordTextField.text == password {
            performSegue(withIdentifier: "showWelcome", sender: nil)
        } else {
            showAlert(with: "Invalid login or password", and: "Please, enter correct login or password")
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
            tryToLogin()
        default:
            break
        }
        return false
    }
}
