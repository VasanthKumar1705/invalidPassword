//
//  customTextField.swift
//  InvalidPassword
//
//  Created by vasanth on 28/10/21.
//

import Foundation
import UIKit

class floatingTextFieldView : UIView {
    @IBOutlet var errorlabel: UILabel!
    @IBOutlet var FloatingTextFieldheight: NSLayoutConstraint!
    @IBOutlet var contentView: UIView!
    @IBOutlet var passwordVisiblityButton: UIButton!
    @IBOutlet var FloatingTextField: UITextField!
    
    @IBOutlet var FloatingPlaceholderLabel: UILabel!
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
    
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
 
        func commonInit() {
            // standard initialization logic
            let nib = Bundle.main.loadNibNamed("floatingTextFieldView", owner: self, options: nil)![0] as! UIView
            nib.frame = self.bounds
            setup()
            addSubview(nib)

        }
    
    func setup() {
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        FloatingTextFieldheight.constant = 50
        passwordVisiblityButton.isHidden = true
        errorlabel.isHidden = true
        
    }

    func showFloatinglabel(){
        FloatingTextFieldheight.constant = 33
        FloatingTextField.attributedPlaceholder = NSAttributedString(
            string: FloatingPlaceholderLabel.text!,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
    }
  
    
    func validation(){
        if FloatingTextField.text == "" {
            print("Password is empty")
            FloatingPlaceholderLabel.textColor = .red
            FloatingTextField.attributedPlaceholder = NSAttributedString(
                string: FloatingPlaceholderLabel.text!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
            )
            contentView.layer.borderColor = UIColor.red.cgColor
            errorlabel.isHidden = false
        } else {
            print("Password is filled")
            FloatingPlaceholderLabel.textColor = .black
            contentView.layer.borderColor = UIColor.black.cgColor
            errorlabel.isHidden = true
        }
        FloatingTextFieldheight.constant = 33
    }
    
    func successValidation(){
        print("Password is empty")
        FloatingPlaceholderLabel.textColor = .red
        FloatingTextField.attributedPlaceholder = NSAttributedString(
            string: FloatingPlaceholderLabel.text!,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        contentView.layer.borderColor = UIColor.red.cgColor
        errorlabel.isHidden = false
        FloatingTextFieldheight.constant = 33
    }
    func failureValidation() {
        print("Password is filled")
        FloatingPlaceholderLabel.textColor = .black
        contentView.layer.borderColor = UIColor.black.cgColor
        errorlabel.isHidden = true
        FloatingTextFieldheight.constant = 33
    }
    func clearAll(){
        FloatingTextField.text = ""
        FloatingTextFieldheight.constant = 50
        FloatingTextField.attributedPlaceholder = NSAttributedString(
            string: FloatingPlaceholderLabel.text!,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        errorlabel.isHidden = true
        FloatingPlaceholderLabel.textColor = .black
        contentView.layer.borderColor = UIColor.gray.cgColor
    }
}
