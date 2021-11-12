//
//  secondViewController.swift
//  InvalidPassword
//
//  Created by vasanth on 28/10/21.
//

import UIKit

class secondViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet var emailTextFieldView: floatingTextFieldView!
    @IBOutlet var passTextFieldView: floatingTextFieldView!
    @IBOutlet var nametextFieldView: floatingTextFieldView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passTextFieldView.layer.cornerRadius = 20
        nametextFieldView.layer.cornerRadius = 20
        emailTextFieldView.layer.cornerRadius = 20
        passTextFieldView.errorlabel.text = "please set up the password field!"
        nametextFieldView.errorlabel.text = "please set up the name field!"
        emailTextFieldView.errorlabel.text = "please set up the email field!"
        passTextFieldView.FloatingTextField.placeholder = "password"
        emailTextFieldView.FloatingTextField.placeholder = "email"
        nametextFieldView.FloatingTextField.placeholder = "name"
        emailTextFieldView.FloatingPlaceholderLabel.text = "email"
        passTextFieldView.FloatingPlaceholderLabel.text = "password"
        nametextFieldView.FloatingPlaceholderLabel.text = "name"
        
        hideKeyboardOnTapAround()
        emailTextFieldView.FloatingTextField.delegate = self
        passTextFieldView.FloatingTextField.delegate = self
        nametextFieldView.FloatingTextField.delegate = self
    }
    
    

    @IBAction func validateButtonTapped(_ sender: Any) {
        
        
        nametextFieldView.validation()
        emailTextFieldView.validation()
        passTextFieldView.validation()
    }
    func hideKeyboardOnTapAround() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
            tap.cancelsTouchesInView = false
            self.view.addGestureRecognizer(tap)
        }
        
        @objc func hideKeyboard() {
            self.view.endEditing(true)
        }
    @IBAction func clearAllButtonTapped(_ sender: Any) {
        nametextFieldView.clearAll()
        passTextFieldView.clearAll()
        emailTextFieldView.clearAll()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        nametextFieldView.showFloatinglabel()
        emailTextFieldView.showFloatinglabel()
        passTextFieldView.showFloatinglabel()
        if textField == nametextFieldView.FloatingTextField {
            if passTextFieldView.FloatingTextField.text == "" {
                passTextFieldView.clearAll()
            }
            if emailTextFieldView.FloatingTextField.text == "" {
                emailTextFieldView.clearAll()
            }
            
        }else if textField == passTextFieldView.FloatingTextField{
            if nametextFieldView.FloatingTextField.text == "" {
                nametextFieldView.clearAll()
            }
            if emailTextFieldView.FloatingTextField.text == "" {
                emailTextFieldView.clearAll()
            }
        }else {
            if nametextFieldView.FloatingTextField.text == "" {
                nametextFieldView.clearAll()
            }
            if passTextFieldView.FloatingTextField.text == "" {
                passTextFieldView.clearAll()
            }
        }

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
           return false
    }
}
