//
//  ViewController.swift
//  Pass-Generator
//
//  Created by Ehsan on 16/01/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var guestButon: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var dateOfVisit: UITextField!
    @IBOutlet weak var project: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var streetAddress: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    
    var firstRowButton: FirstRowButtonType? = nil
    var secondRowButton: SecondRowButtonType? = nil
    
    var pass: Pass? = nil
    
    let companyData: [String] = [VendorCompany.Acme.rawValue, VendorCompany.Fedex.rawValue, VendorCompany.NWElectrical.rawValue, VendorCompany.Orkin.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //test()
        
        hideButtons()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // toolbar
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(ViewController.dismissPicker))
        
        // adding Done button for all the input fields (Keyboard, UIPicker)
        
        dateOfBirth.inputAccessoryView = toolBar
        dateOfVisit.inputAccessoryView = toolBar
        project.inputAccessoryView = toolBar
        firstName.inputAccessoryView = toolBar
        lastName.inputAccessoryView = toolBar
        company.inputAccessoryView = toolBar
        streetAddress.inputAccessoryView = toolBar
        city.inputAccessoryView = toolBar
        state.inputAccessoryView = toolBar
        zipCode.inputAccessoryView = toolBar
        
        
        
        
        // Company picker
        let companyPicker = UIPickerView()
        company.inputView = companyPicker
        companyPicker.delegate = self
        company.inputAccessoryView = toolBar
        
        self.hideKeyboardWhenTappedAround()
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

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPass" {
            let vc = segue.destination as! PageController
            vc.pass = pass
        }
    }
    
    
    
    @IBAction func guestActivated(_ sender: UIButton) {
        showButtons()
        button1.setTitle("Child", for: .normal)
        button2.setTitle("Adult", for: .normal)
        button3.setTitle("Senior", for: .normal)
        button4.setTitle("VIP", for: .normal)
        
        firstRowButton = FirstRowButtonType.Guest
    }
    
    
    @IBAction func employeeActivated(_ sender: UIButton) {
        showButtons()
        button1.setTitle("Food Service", for: .normal)
        button2.setTitle("Ride Service", for: .normal)
        button3.setTitle("Maintenance", for: .normal)
        button4.setTitle("Contract", for: .normal)
        
        firstRowButton = FirstRowButtonType.Employee
    }
    
    
    @IBAction func managerActivated(_ sender: UIButton) {
        hideButtons()
        enableAllTextField()
        disableTextField(textField: dateOfVisit)
        disableTextField(textField: project)
        
        firstRowButton = FirstRowButtonType.Manager
    }
    
    
    @IBAction func vendorActivated(_ sender: UIButton) {
        hideButtons()
        enableAllTextField()
        disableTextField(textField: project)
        
        firstRowButton = FirstRowButtonType.Vendor
    }
    
    
    
    @IBAction func button1Activated(_ sender: UIButton) {
        if sender.currentTitle == "Child" {
            disableAllTextFields()
            enableTextField(textField: dateOfBirth)
            secondRowButton = SecondRowButtonType.Child
        }
        
        if sender.currentTitle == "Food Service" {
            enableAllTextField()
            disableTextField(textField: dateOfVisit)
            disableTextField(textField: project)
            secondRowButton = SecondRowButtonType.FoodService
        }
    }
    
    
    
    @IBAction func button2Activated(_ sender: UIButton) {
        if sender.currentTitle == "Adult" {
            disableAllTextFields()
            secondRowButton = SecondRowButtonType.Adult
        }
        
        if sender.currentTitle == "Ride Service" {
            enableAllTextField()
            disableTextField(textField: dateOfVisit)
            disableTextField(textField: project)
            secondRowButton = SecondRowButtonType.RideService
        }
    }
    
    
    
    @IBAction func button3Activated(_ sender: UIButton) {
        if sender.currentTitle == "Senior" {
            disableAllTextFields()
            enableTextField(textField: dateOfBirth)
            secondRowButton = SecondRowButtonType.Senior
        }
        
        if sender.currentTitle == "Maintenance" {
            enableAllTextField()
            disableTextField(textField: dateOfVisit)
            disableTextField(textField: project)
            secondRowButton = SecondRowButtonType.Maintenance
        }
    }
    
    
   
    @IBAction func button4Activated(_ sender: UIButton) {
        if sender.currentTitle == "VIP" {
            disableAllTextFields()
            secondRowButton = SecondRowButtonType.VIP
        }
        
        if sender.currentTitle == "Contract" {
            enableAllTextField()
            disableTextField(textField: dateOfVisit)

            secondRowButton = SecondRowButtonType.Contract
        }
    }
    
    
    // Date pickers -----------------
    @IBAction func dateOfBirthPicker(_ sender: UITextField) {
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        dateOfBirth.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(ViewController.updateDateOfBirthFromValueChanged), for: UIControlEvents.valueChanged)
    }
    
    @objc func updateDateOfBirthFromValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateOfBirth.text = dateFormatter.string(from: sender.date)
    }
    
    
    @IBAction func dateOfVisitPicker(_ sender: UITextField) {
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        dateOfVisit.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(ViewController.updateDateOfVisitFromValueChanged), for: UIControlEvents.valueChanged)
    }
    
    @objc func updateDateOfVisitFromValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateOfVisit.text = dateFormatter.string(from: sender.date)
    }
    //----------------------------
    
    
    // helper functions for company picker ----------
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return companyData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return companyData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        company.text = companyData[row]
    }
    //-------------------------------------------------
    
    
    @IBAction func generatePass(_ sender: UIButton) {
    
        guard let firstRowButtonUnwrapped = firstRowButton else {
            print("Empty")
            return
        }
        
        switch firstRowButtonUnwrapped {
        case .Guest:
            // There are 4 options for Guests
            //Child
            if secondRowButton == SecondRowButtonType.Child {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MM-yyyy"
                if let dateOfBirthUnwrapped = dateOfBirth.text {
                    let dateFromString: Date? = dateFormatter.date(from: dateOfBirthUnwrapped)
                    do {
                        let child = try ChildGuest(dateOfBirth: dateFromString)
                        pass = CheckPoint.generatePass(entrant: child)
                    } catch {
                        genericAlert(error: error)
                    }
                }
            }
            
            // Adult
            if secondRowButton == SecondRowButtonType.Adult {
                let adult = ClassicGuest()
                pass = CheckPoint.generatePass(entrant: adult)
            }
            
            // Senior
            if secondRowButton == SecondRowButtonType.Senior {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MM-yyyy"
                if let dateOfBirthUnwrapped = dateOfBirth.text {
                    let dateFromString: Date? = dateFormatter.date(from: dateOfBirthUnwrapped)
                    do {
                        let senior = try SeniorGuest(firstName: firstName.text, lastName: lastName.text, dateOfBirth: dateFromString)
                        pass = CheckPoint.generatePass(entrant: senior)
                    } catch {
                        genericAlert(error: error)
                    }
                }
            }
            
            // VIP
            if secondRowButton == SecondRowButtonType.VIP {
                let vip = VIPGuest()
                pass = CheckPoint.generatePass(entrant: vip)
            }
            
        case .Employee:
            // There are 4 options for employees
            // FoodServiceEmployee
            if secondRowButton == SecondRowButtonType.FoodService {
                do {
                    let foodServiceEmployee = try FoodServiceEmployee(firstName: firstName.text, lastName: lastName.text, streetAddress: streetAddress.text, city: city.text, state: state.text, zipCode: zipCode.text, dateOfBirth: nil)
                    
                    pass = CheckPoint.generatePass(entrant: foodServiceEmployee)
                } catch {
                    genericAlert(error: error)
                }
            }
            
            // RideServiceEmployee
            if secondRowButton == SecondRowButtonType.RideService {
                do {
                    let rideServiceEmployee = try RideServiceEmployee(firstName: firstName.text, lastName: lastName.text, streetAddress: streetAddress.text, city: city.text, state: state.text, zipCode: zipCode.text, dateOfBirth: nil)
                    
                    pass = CheckPoint.generatePass(entrant: rideServiceEmployee)
                } catch {
                    genericAlert(error: error)
                }
            }
            
            // MaintenanceEmployee
            if secondRowButton == SecondRowButtonType.Maintenance {
                do {
                    let maintenanceEmployee = try MaintenanceEmployee(firstName: firstName.text, lastName: lastName.text, streetAddress: streetAddress.text, city: city.text, state: state.text, zipCode: zipCode.text, dateOfBirth: nil)
                    
                    pass = CheckPoint.generatePass(entrant: maintenanceEmployee)
                } catch {
                    genericAlert(error: error)
                }
            }
            
            // ContractEmployee
            if secondRowButton == SecondRowButtonType.Contract {
                if let projectNumberUnwrapped = project.text {
                    do {
                        let contractEmployee = try ContractEmployee(firstName: firstName.text, lastName: lastName.text, streetAddress: streetAddress.text, city: city.text, state: state.text, zipCode: zipCode.text, projectNumber: Int(projectNumberUnwrapped))
                        
                        pass = CheckPoint.generatePass(entrant: contractEmployee)
                    } catch {
                        genericAlert(error: error)
                    }
                }
            }
            
        case .Manager:
            do {
                let manager = try Manager(firstName: firstName.text, lastName: lastName.text, streetAddress: streetAddress.text, city: city.text, state: state.text, zipCode: zipCode.text, dateOfBirth: nil)
                
                pass = CheckPoint.generatePass(entrant: manager)
            } catch {
                genericAlert(error: error)
            }
            
        case .Vendor:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            
            if let vendorCompanyUnwrapped = company.text, let dateOfBirthUnwrapped = dateOfBirth.text, let dateOfVisitUnwrapped = dateOfVisit.text {
                let dateOfBirthFromString: Date? = dateFormatter.date(from: dateOfBirthUnwrapped)
                let dateOfVisitFromString: Date? = dateFormatter.date(from: dateOfVisitUnwrapped)
                do {
                    let vendor = try Vendor(firstName: firstName.text, lastName: lastName.text, vendorCompany: VendorCompany(rawValue: vendorCompanyUnwrapped), dateOfBirth: dateOfBirthFromString, dateOfVisit: dateOfVisitFromString)
                    
                    pass = CheckPoint.generatePass(entrant: vendor)
                } catch {
                    genericAlert(error: error)
                }
            }
            
        }
        
    }
    
    
    
    // Helper methods
    // Method to hide the buttons at the second row
    func hideButtons() {
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
        button4.isHidden = true
    }
    
    // Method to show the buttons at the second row
    func showButtons() {
        button1.isHidden = false
        button2.isHidden = false
        button3.isHidden = false
        button4.isHidden = false
        
    }
    
    
    func disableAllTextFields() {
        disableTextField(textField: dateOfBirth)
        disableTextField(textField: dateOfVisit)
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
        enableTextField(textField: dateOfVisit)
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
        textField.text = ""
    }
    
    
    func enableTextField(textField: UITextField) {
        textField.isEnabled = true
        textField.backgroundColor = UIColor.white
        textField.text = ""
    }
    
    // Generic function to show error messages to user
    func genericAlert<T>(error: T) {
        let alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

}

