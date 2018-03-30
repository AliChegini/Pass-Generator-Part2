//
//  ViewController.swift
//  Pass-Generator
//
//  Created by Ehsan on 16/01/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var guestButon: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var ssn: UITextField!
    @IBOutlet weak var project: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var streetAddress: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //test()
        hideButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func guestActivated(_ sender: UIButton) {
        showButtons()
        button1.setTitle("Child", for: .normal)
        button2.setTitle("Adult", for: .normal)
        button3.setTitle("Senior", for: .normal)
        button4.setTitle("VIP", for: .normal)
    }
    
    
    @IBAction func employeeActivated(_ sender: UIButton) {
        showButtons()
        button1.setTitle("Food Service", for: .normal)
        button2.setTitle("Ride Service", for: .normal)
        button3.setTitle("Maintenance", for: .normal)
        button4.setTitle("Contract", for: .normal)
    }
    
    
    @IBAction func managerActivated(_ sender: UIButton) {
        hideButtons()
        enableAllTextField()
    }
    
    
    @IBAction func vendorActivated(_ sender: UIButton) {
        hideButtons()
        enableAllTextField()
    }
    
    
    
    @IBAction func button1Activated(_ sender: UIButton) {
        if sender.currentTitle == "Child" {
            disableAllTextFields()
            enableTextField(textField: dateOfBirth)
        }
        
        if sender.currentTitle == "Food Service" {
            enableAllTextField()
        }
    }
    
    
    
    @IBAction func button2Activated(_ sender: UIButton) {
        if sender.currentTitle == "Adult" {
            disableAllTextFields()
        }
        
        if sender.currentTitle == "Ride Service" {
            enableAllTextField()
        }
    }
    
    
    
    @IBAction func button3Activated(_ sender: UIButton) {
        if sender.currentTitle == "Senior" {
            disableAllTextFields()
            enableTextField(textField: dateOfBirth)
        }
        
        if sender.currentTitle == "Maintenance" {
            enableAllTextField()
        }
    }
    
    
   
    @IBAction func button4Activated(_ sender: UIButton) {
        if sender.currentTitle == "VIP" {
             disableAllTextFields()
        }
        
        if sender.currentTitle == "Contract" {
            enableAllTextField()
        }
    }
    
    
    // Helper methods
    func hideButtons() {
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
        button4.isHidden = true
    }
    
    func showButtons() {
        button1.isHidden = false
        button2.isHidden = false
        button3.isHidden = false
        button4.isHidden = false
        
    }
    
    
    func disableAllTextFields() {
        disableTextField(textField: dateOfBirth)
        disableTextField(textField: ssn)
        disableTextField(textField: project)
        disableTextField(textField: firstName)
        disableTextField(textField: lastName)
        disableTextField(textField: company)
        disableTextField(textField: streetAddress)
        disableTextField(textField: city)
        disableTextField(textField: state)
        disableTextField(textField: zipCode)
    }
    
    func enableAllTextField() {
        enableTextField(textField: dateOfBirth)
        enableTextField(textField: ssn)
        enableTextField(textField: project)
        enableTextField(textField: firstName)
        enableTextField(textField: lastName)
        enableTextField(textField: company)
        enableTextField(textField: streetAddress)
        enableTextField(textField: city)
        enableTextField(textField: state)
        enableTextField(textField: zipCode)
    }
    
    
    func disableTextField(textField: UITextField){
        textField.isEnabled = false
        textField.backgroundColor = UIColor.lightGray
    }
    
    
    func enableTextField(textField: UITextField) {
        textField.isEnabled = true
        textField.backgroundColor = UIColor.white
    }
    
    

}

