//
//  ViewController.swift
//  DZ-4
//
//  Created by Evgeniy Nagibin on 17.12.2023.
//

import UIKit
let correctUserName = "Evgen"
let correctPassword = "1234"
var (validUser, validPass) = (false, false)


class ViewController: UIViewController {
    
    enum alertState {
        case unCorrectUser
        case EmptyUser
        case unCorrectPass
        case EmptyPass
    }
    
    @IBOutlet var userField: UITextField!
    @IBOutlet var passField: UITextField!
    @IBOutlet var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func showAlertDialog(at state: alertState) {
        var alertController = UIAlertController()
        switch state {
        case .EmptyUser:
            alertController = UIAlertController(title: "Внимание", message: "Вы не ввели ваше имя", preferredStyle: .alert)
        case .unCorrectUser:
            alertController = UIAlertController(title: "Внимание", message: "Имя пользователя не верно", preferredStyle: .alert)
        case .EmptyPass:
            alertController = UIAlertController(title: "Внимание", message: "Вы не ввели пароль", preferredStyle: .alert)
        case .unCorrectPass:
            alertController = UIAlertController(title: "Внимание", message: "Пароль не верен", preferredStyle: .alert)
        }
        
        
        // Добавление действий (кнопок) к алерту
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // Обработка нажатия на кнопку OK
            print("Нажата кнопка OK")
        }
        alertController.addAction(okAction)
    }
    
    @IBAction func logInButtonAction(_ sender: Any) {
        if let userName = userField.text {
            if userName == correctUserName {
                validUser = true
            } else {
                showAlertDialog(at: .unCorrectUser)
                print("unCorrectUser")
            }
        } else {
            showAlertDialog(at: .EmptyUser)
            print("EmptyUser")
        }
        
        if let passw = passField.text {
            if passw == correctPassword {
                validPass = true
            } else {
                showAlertDialog(at: .unCorrectPass)
                print("unCorrectPass")
            }
        } else {
            showAlertDialog(at: .EmptyPass)
            print("EmptyPass")
        }
    }
    

}

