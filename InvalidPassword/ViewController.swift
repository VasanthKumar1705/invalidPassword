//
//  ViewController.swift
//  InvalidPassword
//
//  Created by vasanth on 28/10/21.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet var pwdvisiblityButton: UIButton!
    var iconClick = true
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var pwdTextfieldHeightConstraint: NSLayoutConstraint!
    @IBOutlet var pwdViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var pwdView: UIView!
    @IBOutlet var PHLabel: UILabel!
    @IBOutlet var pwdTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pwdTextField.delegate = self
        pwdView.layer.borderColor = UIColor.black.cgColor
        self.pwdView.layer.borderWidth = 1
        self.pwdView.layer.cornerRadius = 15
        self.pwdView.layer.masksToBounds = true
        PHLabel.text = pwdTextField.placeholder
        pwdTextfieldHeightConstraint.constant = 50
        errorLabel.isHidden = true
        pwdTextField.isSecureTextEntry = true

        hideKeyboardOnTapAround()
    }
    func hideKeyboardOnTapAround() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
            tap.cancelsTouchesInView = false
            self.view.addGestureRecognizer(tap)
        }
        
        @objc func hideKeyboard() {
            pwdTextfieldHeightConstraint.constant = 33
            self.view.endEditing(true)
        }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        pwdTextfieldHeightConstraint.constant = 33
        pwdTextField.attributedPlaceholder = NSAttributedString(
            string: "password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           self.view.endEditing(true)
           return false
       }
    @IBAction func checkValidButtontapped(_ sender: Any) {
        print("Button Pressed!!..")
        if pwdTextField.text == "" {
            print("Password is empty")
            PHLabel.textColor = .red
            pwdTextField.attributedPlaceholder = NSAttributedString(
                string: "password",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
            )
            pwdView.layer.borderColor = UIColor.red.cgColor
            errorLabel.isHidden = false
        } else {
            print("Password is filled")
            PHLabel.textColor = .black
            pwdView.layer.borderColor = UIColor.black.cgColor
            errorLabel.isHidden = true
        }
        pwdTextfieldHeightConstraint.constant = 33
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        self.pwdTextField.text = ""
        pwdTextfieldHeightConstraint.constant = 50
        pwdTextField.attributedPlaceholder = NSAttributedString(
            string: "password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        errorLabel.isHidden = true
        PHLabel.textColor = .black
        pwdView.layer.borderColor = UIColor.black.cgColor
        
    }
    @IBAction func pwdVisiblityButtonTapped(_ sender: Any) {
        if(iconClick == true) {
            pwdTextField.isSecureTextEntry = false
            pwdvisiblityButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)

        } else {
            pwdTextField.isSecureTextEntry = true
            pwdvisiblityButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)

        }
        iconClick = !iconClick
    }
}

