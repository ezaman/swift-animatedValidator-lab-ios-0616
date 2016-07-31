//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    
    @IBOutlet weak var Yconstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
     super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.enabled = false
        
        self.emailTextField.delegate = self
        self.emailConfirmationTextField.delegate = self
        self.phoneTextField.delegate = self
        self.passwordTextField.delegate = self
        self.passwordConfirmTextField.delegate = self
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        isValidText(textField)
    }
    
    func isValidText (textfield: UITextField) {
        let validText = textfield.text!.characters.count > 0
        let validEmail = self.emailTextField.text!.containsString("@")  && self.emailTextField.text!.containsString(".")
        let validConfirmEmail = self.emailConfirmationTextField.text == self.emailTextField.text && self.emailConfirmationTextField.text!.characters.count > 0
        let validPhone = self.phoneTextField.text?.characters.count >= 7
        let validPassword = self.passwordTextField.text?.characters.count >= 6
        let validPasswordConfirm = self.passwordConfirmTextField.text == self.passwordTextField.text && self.passwordConfirmTextField.text!.characters.count > 0
        
        switch textfield {
        case emailTextField:
            if validText && validEmail {
                self.emailTextField.backgroundColor = UIColor.whiteColor()
            }else {
                moveTextField(emailTextField)
            }
            
        case emailConfirmationTextField:
            if validConfirmEmail && validEmail {
                self.emailConfirmationTextField.backgroundColor = UIColor.whiteColor()
                
            }else {
                moveTextField(emailConfirmationTextField)
            }
            
        case phoneTextField:
            if validPhone {
                self.phoneTextField.backgroundColor = UIColor.whiteColor()
            }else {
                moveTextField(phoneTextField)
            }
            
        case passwordTextField:
            if validPassword {
                self.passwordTextField.backgroundColor = UIColor.whiteColor()
            }else {
                moveTextField(passwordTextField)
            }
            
        case passwordConfirmTextField:
            if validPasswordConfirm {
                self.passwordConfirmTextField.backgroundColor = UIColor.whiteColor()
            }else {
                moveTextField(passwordConfirmTextField)
            }
            
        default:
            break
        }
        
        if validPasswordConfirm && validPassword && validPhone && validEmail && validConfirmEmail && validText {
            moveButton()
        }
        
    }
    
    func moveButton() {
        UIView.animateWithDuration(1) {
            self.Yconstraint.constant = 300
            self.view.layoutIfNeeded()
            self.submitButton.enabled = true
        }
    }
    
    
    func moveTextField(textfield: UITextField) {
        UIView.animateWithDuration(0.25, delay: 0.0, options: [.Repeat, .Autoreverse], animations: {
            UIView.setAnimationRepeatCount(3.0)
            textfield.transform = CGAffineTransformMakeScale(0.6, 0.6)
            textfield.backgroundColor = UIColor.redColor()
            self.view.layoutIfNeeded()
        }) {(true) in
            textfield.transform = CGAffineTransformMakeScale(1.0, 1.0)
            
        }
    }
    
    
}


//func textFieldDidEndEditing (textField: UITextField) {
//    isValidText(textField)
//}
//
//func isValidText(textField: UITextField) {
//    let goodText = textField.text!.characters.count > 0
//    let goodEmail = self.emailTextField.text!;containsString("@") && self.emailTextField.text.!containsString(".")



