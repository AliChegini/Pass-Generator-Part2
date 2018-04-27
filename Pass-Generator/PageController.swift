//
//  PageController.swift
//  Pass-Generator
//
//  Created by Ehsan on 23/04/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

import UIKit
import AudioToolbox

class PageController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var passType: UILabel!
    @IBOutlet weak var rideAccess: UILabel!
    @IBOutlet weak var foodDiscount: UILabel!
    @IBOutlet weak var merchDiscount: UILabel!
    @IBOutlet weak var result: UILabel!
    
    var pass: Pass?
    
    // Audio variables
    var accessDenied: SystemSoundID = 0
    var accessGranted: SystemSoundID = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSounds()
        
        if let firstNameUnwarpped = pass?.firstName, let lastNameUnwarpped = pass?.lastName {
            name.text = "\(firstNameUnwarpped) \(lastNameUnwarpped)"
        }
        
        if let passTypeUnwrapped = pass?.entrantType {
            passType.text = "\(passTypeUnwrapped)"
        }
        
        
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
    
    @IBAction func testAmusementArea(_ sender: UIButton) {
        // Force unwrapping the pass is OK, as we are 100% sure pass is not nil
        // since user will only see this page if pass is initialized
        if pass!.areaAccess.contains(.amusementAreas) {
            result.backgroundColor = .green
            playCorrectAnswerSound()
        } else {
            result.backgroundColor = .red
            playWrongAnswerSound()
        }
        result.text = CheckPoint.checkPassForAreaAccess(pass: &pass!, to: .amusementAreas)
    }
    
    
    @IBAction func testKitchenArea(_ sender: UIButton) {
        // Force unwrapping the pass is OK, as we are 100% sure pass is not nil
        // since user will only see this page if pass is initialized
        if pass!.areaAccess.contains(.kitchenAreas) {
            result.backgroundColor = .green
            playCorrectAnswerSound()
        } else {
            result.backgroundColor = .red
            playWrongAnswerSound()
        }
        result.text = CheckPoint.checkPassForAreaAccess(pass: &pass!, to: .kitchenAreas)
    }
    
    
    @IBAction func testOfficeArea(_ sender: UIButton) {
        // Force unwrapping the pass is OK, as we are 100% sure pass is not nil
        // since user will only see this page if pass is initialized
        if pass!.areaAccess.contains(.officeAreas) {
            result.backgroundColor = .green
            playCorrectAnswerSound()
        } else {
            result.backgroundColor = .red
            playWrongAnswerSound()
        }
        result.text = CheckPoint.checkPassForAreaAccess(pass: &pass!, to: .officeAreas)
    }
    
    
    @IBAction func testMaintenanceArea(_ sender: UIButton) {
        // Force unwrapping the pass is OK, as we are 100% sure pass is not nil
        // since user will only see this page if pass is initialized
        if pass!.areaAccess.contains(.maintenanceAreas) {
            result.backgroundColor = .green
            playCorrectAnswerSound()
        } else {
            result.backgroundColor = .red
            playWrongAnswerSound()
        }
        result.text = CheckPoint.checkPassForAreaAccess(pass: &pass!, to: .maintenanceAreas)
    }
    
    
    @IBAction func testRideControlArea(_ sender: UIButton) {
        // Force unwrapping the pass is OK, as we are 100% sure pass is not nil
        // since user will only see this page if pass is initialized
        if pass!.areaAccess.contains(.rideControlAreas) {
            result.backgroundColor = .green
            playCorrectAnswerSound()
        } else {
            result.backgroundColor = .red
            playWrongAnswerSound()
        }
        result.text = CheckPoint.checkPassForAreaAccess(pass: &pass!, to: .rideControlAreas)
    }
    
    
    @IBAction func testRideAccess(_ sender: UIButton) {
        result.backgroundColor = .white
        if let ridesAccessUnwrapped = pass?.rideAccess {
            var phrase: String = ""
            for ride in ridesAccessUnwrapped {
                phrase += "\(ride.rawValue)\n"
            }
            result.text = phrase
            
            if ridesAccessUnwrapped.count == 0 {
                result.text = "No Ride Access!"
                playWrongAnswerSound()
            } else {
                playCorrectAnswerSound()
            }
        }
    }
    
    
    @IBAction func testDiscountAccess(_ sender: UIButton) {
        result.backgroundColor = .white
        if let discountOnFoodUnwrapped = pass?.discountOnFood, let discountOnMerchandiseUnwrapped = pass?.discountOnMerchandise {
            result.text = "\n\(discountOnFoodUnwrapped)% Food Discount\n\(discountOnMerchandiseUnwrapped)% Merch Discount"
            playCorrectAnswerSound()
        } else {
            result.text = "No Discount!"
            playWrongAnswerSound()
        }
    }
    
    
    
    // Helper functions
    // load and play sounds for correct and wrong answer
    func loadSounds() {
        let pathToCorrectSoundFile = Bundle.main.path(forResource: "AccessGranted", ofType: "wav")
        let correctSoundURL = URL(fileURLWithPath: pathToCorrectSoundFile!)
        AudioServicesCreateSystemSoundID(correctSoundURL as CFURL, &accessGranted)
        
        let pathToWrongSoundFile = Bundle.main.path(forResource: "AccessDenied", ofType: "wav")
        let wrongSoundURL = URL(fileURLWithPath: pathToWrongSoundFile!)
        AudioServicesCreateSystemSoundID(wrongSoundURL as CFURL, &accessDenied)
    }
    
    func playCorrectAnswerSound() {
        AudioServicesPlaySystemSound(accessGranted)
    }
    
    func playWrongAnswerSound() {
        AudioServicesPlaySystemSound(accessDenied)
    }
    
    
}
