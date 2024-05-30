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
    
    let userName = "Vlad"
    let password = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SecondViewController else {return}
        secondVC.welcomeName = userNameTF.text ?? ""
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

// MARK: - AlertController

extension MainViewController {
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


// MARK: - UITextField

extension MainViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTF.becomeFirstResponder()
    }
}
