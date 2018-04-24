//
//  PageController.swift
//  Pass-Generator
//
//  Created by Ehsan on 23/04/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

import UIKit

class PageController: UIViewController {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var passType: UILabel!
    @IBOutlet weak var rideAccess: UILabel!
    @IBOutlet weak var foodDiscount: UILabel!
    @IBOutlet weak var merchDiscount: UILabel!
    
    
    var pass: Pass?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let firstNameUnwarpped = pass?.firstName, let lastNameUnwarpped = pass?.lastName {
            name.text = "\(firstNameUnwarpped) \(lastNameUnwarpped)"
            print("\(firstNameUnwarpped)!\(lastNameUnwarpped)!")
        }
        
        if let passTypeUnwrapped = pass?.entrantType {
            passType.text = "\(passTypeUnwrapped)"
        }
        
        // label.text = (label.text ?? "") + " some other word(s)"
        
        if let ridesAccessUnwrapped = pass?.rideAccess {
            var phrase: String = ""
            for ride in ridesAccessUnwrapped {
                phrase += " \(ride.rawValue)"
            }
            rideAccess.text = phrase
        }
        
        if let discountOnFoodUnwrapped = pass?.discountOnFood {
            foodDiscount.text = "\(discountOnFoodUnwrapped)% Food Discount"
        }
        
        if let discountOnMerchandiseUnwrapped = pass?.discountOnMerchandise {
            merchDiscount.text = "\(discountOnMerchandiseUnwrapped)% Merch Discount"
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func createNewPass(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    


}
