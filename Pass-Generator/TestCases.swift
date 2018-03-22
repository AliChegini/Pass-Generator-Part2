//
//  TestCases.swift
//  Pass-Generator
//
//  Created by Ehsan on 22/02/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

import Foundation

// By running the app, the test method will be called from ViewController,
// and all the test cases will be executed
func test() {
    
    
    // success case for VIP guest entering amusement areas -- allowed
    print("Test case 1 ...")
    let vipGuest1 = VIPGuest()
    var vipPass1 = CheckPoint.generatePass(entrant: vipGuest1)
    CheckPoint.checkPassForAreaAccess(pass: &vipPass1, to: .amusementAreas)
    print("--- ")
    
    
    // fail case for VIP guest entering kitchen --- denied
    print("Test case 2 ...")
    let vipGuest2 = VIPGuest()
    var vipPass2 = CheckPoint.generatePass(entrant: vipGuest2)
    CheckPoint.checkPassForAreaAccess(pass: &vipPass2, to: .kitchenAreas)
    print("--- ")
    
    
    // success case for child guest entering amusement areas -- allowed
    // Date of birth is set to today so the birthday message shows up
    do {
        print("Test case 3 ...")
        let childGuest =  try ChildGuest(dateOfBirth: Date())
        var childPass = CheckPoint.generatePass(entrant: childGuest)
        CheckPoint.checkPassForAreaAccess(pass: &childPass, to: .amusementAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    // success case for child guest entering amusement areas -- allowed
    // Date of birth is set to some date so birthday message does not show up
    do {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        let someDate = formatter.date(from: "21.04.16")
        
        print("Test case 4 ...")
        let childGuest =  try ChildGuest(dateOfBirth: someDate)
        var childPass = CheckPoint.generatePass(entrant: childGuest)
        CheckPoint.checkPassForAreaAccess(pass: &childPass, to: .amusementAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    // fail case for child guest being too old --- Error handled
    do {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        let someDate = formatter.date(from: "21.04.07")
        
        print("Test case 5 ...")
        let childGuest =  try ChildGuest(dateOfBirth: someDate)
        var childPass = CheckPoint.generatePass(entrant: childGuest)
        CheckPoint.checkPassForAreaAccess(pass: &childPass, to: .amusementAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    // fail case for child guest missing date of birth --- Error handled
    do {
        print("Test case 6 ...")
        let childGuest =  try ChildGuest(dateOfBirth: nil)
        var childPass = CheckPoint.generatePass(entrant: childGuest)
        CheckPoint.checkPassForAreaAccess(pass: &childPass, to: .amusementAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    // success case for food service employee enetring the kitchen --- allowed
    do {
        print("Test case 7 ...")
        let foodServiceEmployee = try FoodServiceEmployee(firstName: "jimmi", lastName: "jimson", streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: "1234", dateOfBirth: nil)
        var kitchenPass = CheckPoint.generatePass(entrant: foodServiceEmployee)
        CheckPoint.checkPassForAreaAccess(pass: &kitchenPass, to: .kitchenAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    // fail case for food service employee with missing first name to trigger the error
    do {
        print("Test case 8 ...")
        let foodServiceEmployee = try FoodServiceEmployee(firstName: nil, lastName: "jimson", streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: "12345", dateOfBirth: nil)
        _ = CheckPoint.generatePass(entrant: foodServiceEmployee)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    // success case for ride service employee enetring the ride area --- allowed
    do {
        print("Test case 9 ...")
        let rideServiceEmployee = try RideServiceEmployee(firstName: "jimmi", lastName: "jimson", streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: "1234", dateOfBirth: nil)
        var ridePass = CheckPoint.generatePass(entrant: rideServiceEmployee)
        CheckPoint.checkPassForAreaAccess(pass: &ridePass, to: .rideControlAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    // fail case for ride service employee enetring the kitchen --- denied entry
    do {
        print("Test case 10 ...")
        let rideServiceEmployee = try RideServiceEmployee(firstName: "jimmi", lastName: "jimson", streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: "1234", dateOfBirth: nil)
        var ridePass = CheckPoint.generatePass(entrant: rideServiceEmployee)
        CheckPoint.checkPassForAreaAccess(pass: &ridePass, to: .kitchenAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    // fail case for ride service employee --- Error missing last name
    do {
        print("Test case 11 ...")
        let rideServiceEmployee = try RideServiceEmployee(firstName: "jimmi", lastName: nil, streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: "1234", dateOfBirth: nil)
        var ridePass = CheckPoint.generatePass(entrant: rideServiceEmployee)
        CheckPoint.checkPassForAreaAccess(pass: &ridePass, to: .rideControlAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    
    // success case for maintenance employee enetring the maintenance area --- allowed
    do {
        print("Test case 12 ...")
        let maintenanceEmployee = try MaintenanceEmployee(firstName: "jimmi", lastName: "jimson", streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: "1234", dateOfBirth: nil)
        var maintenancePass = CheckPoint.generatePass(entrant: maintenanceEmployee)
        CheckPoint.checkPassForAreaAccess(pass: &maintenancePass, to: .maintenanceAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    // fail case for maintenance employee, missing street address --- Error
    do {
        print("Test case 13 ...")
        let maintenanceEmployee = try MaintenanceEmployee(firstName: "jimmi", lastName: "jimson", streetAddress: nil, city: "ibiza", state: "spain", zipCode: "1234", dateOfBirth: nil)
        var maintenancePass = CheckPoint.generatePass(entrant: maintenanceEmployee)
        CheckPoint.checkPassForAreaAccess(pass: &maintenancePass, to: .maintenanceAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    
    // success case for manager enetring the office area --- allowed
    do {
        print("Test case 14 ...")
        let manager = try Manager(firstName: "jimmi", lastName: "jimson", streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: "1234", dateOfBirth: nil)
        var managerPass = CheckPoint.generatePass(entrant: manager)
        CheckPoint.checkPassForAreaAccess(pass: &managerPass, to: .officeAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    
    // fail case for manager, missing zipcode  --- Error
    do {
        print("Test case 15 ...")
        let manager = try Manager(firstName: "jimmi", lastName: "jimson", streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: nil, dateOfBirth: nil)
        var managerPass = CheckPoint.generatePass(entrant: manager)
        CheckPoint.checkPassForAreaAccess(pass: &managerPass, to: .officeAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    // success case for classic guest entering amusement areas -- allowed
    print("Test case 16 ...")
    let classicGuest = ClassicGuest()
    var classicPass = CheckPoint.generatePass(entrant: classicGuest)
    CheckPoint.checkPassForAreaAccess(pass: &classicPass, to: .amusementAreas)
    print("--- ")
    
    
    
    // cases for classic guest swiping too fast
    print("Test case 17 ...")
    // Second swipe should fail due to quick re-swipe
    CheckPoint.checkPassForAreaAccess(pass: &classicPass, to: .amusementAreas)
    
    // Third swipe should succeed after 6 seconds delay
    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
        CheckPoint.checkPassForAreaAccess(pass: &classicPass, to: .amusementAreas)
        print("--- ")
    }
 
   
}
