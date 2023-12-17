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

    enum AlertState {
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

    func showAlertDialog(at state: AlertState) {
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

        // Отображение алерта
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func logInButtonAction(_ sender: Any) {
        if userField.text?.isEmpty ?? true {
            showAlertDialog(at: .EmptyUser)
        } else {
            let userName = userField.text!
            if userName == correctUserName {
                validUser = true
            } else {
                showAlertDialog(at: .unCorrectUser)
            }
        }

        if passField.text?.isEmpty ?? true {
            showAlertDialog(at: .EmptyPass)
        } else {
            let passw = passField.text!
            if passw == correctPassword {
                validPass = true
            } else {
                showAlertDialog(at: .unCorrectPass)
            }
        }
    }
}
