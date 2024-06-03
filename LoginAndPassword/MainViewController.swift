//
//  MainViewController.swift
//  LoginAndPassword
//
//  Created by  Влад on 30.05.2024.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let userName = "Vlad"
    private let password = "123"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SecondViewController else {return}
        secondVC.welcomeName = userName
    }
    
    @IBAction func loginButton() {
        if userNameTF.text == userName && passwordTF.text == password {
        } else {
            passwordTF.text = ""
            alert(title: "Ошибка", message: "Проверьте логин или пароль")
        }
    }
    
    @IBAction func forgotButton(_ sender: UIButton) {
        
        if sender.tag == 0 {
            alert(title: "Забыл логин?", message: userName)
        } else {
            alert(title: "Забыл пароль?", message: password)
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
}

// MARK: - Alert Controller

extension MainViewController {
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


// MARK: - UITextFieldDelegate

extension MainViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginButton()
            performSegue(withIdentifier: "showSecondVC", sender: nil)
        }
        return true
    }
}
