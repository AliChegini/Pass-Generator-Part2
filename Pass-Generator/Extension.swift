//
//  Extension.swift
//  Pass-Generator
//
//  Created by Ehsan on 11/04/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    
    // Generic function to show error messages to user
    func genericAlert<T>(error: T) {
        let alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    // Extra Credit
    // check if the textField is enabled and have allowed length: longer than 2 char
    func validateTextField(textField: UITextField) {
        // branch to handle Zip Code
        if textField.isEnabled == true && textField.placeholder == "Zip Code" {
            if textField.text!.count < 3 || textField.text!.isNumber == false {
                genericAlert(error: "Input for \(textField.placeholder!) can only be numerical, longer than 2 digits")
            }
        }
        // branch to handle all the textfields
        if textField.isEnabled == true && textField.text!.count < 2 {
            genericAlert(error: "Input for \(textField.placeholder!) shoud be longer than 1 characters")
        }
    }
    
    
    // Dismissing the keyboard by tapping around
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    // create Date Formatter
    // return Date? from String
    func createDateFormatter(textField: UITextField) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        var dateFromString: Date?
        if let dateUnwrapped = textField.text {
            dateFromString = dateFormatter.date(from: dateUnwrapped)
        }
        return dateFromString
    }
    
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            // Move the view up, so keyboard have space
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/2
            }
        }
    }
    
    
    @objc func keyboardWillHide(notification: NSNotification) {
        // reset the view y origin if it has been moved
        if self.view.frame.origin.y < 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    @objc func dismissPicker() {
        view.endEditing(true)
    }
    
    
    
}



extension UIToolbar {
    // ToolBar and Done butoon for easier use
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
}


// extension for handling empty textfields properly
// "" <-- this annoying case is covered
extension Optional where Wrapped == String {
    var nilIfEmpty: String? {
        guard let strongSelf = self else {
            return nil
        }
        return strongSelf.isEmpty ? nil : strongSelf
    }
}


// extension to check if a textfiled content is numerical or not
extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}





