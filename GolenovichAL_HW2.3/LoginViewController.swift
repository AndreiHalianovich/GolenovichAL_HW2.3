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
    
    private let userName = "Alex"
    private let password = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userName
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
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
}

// MARK: - Alert controller
extension LoginViewController {
    private func tryToLogin() {
        if userNameTextField.text == userName && passwordTextField.text == password {
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
