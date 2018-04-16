//
//  CheckPoint.swift
//  Pass-Generator
//
//  Created by Ehsan on 20/02/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

import Foundation


// Class to implement the logic for check point
// Each check point can generate new pass,
// and also check the generated pass from all other check points
class CheckPoint {
    static let delayInSeconds: Double = 5
    static let numberOfCharacters: Int = 5    // Number of characters to compare for birthday - dd.MM
    
    
    // Static function to generate passes, takes an Entrant and return a Pass
    // This method can generate all type of passes
    static func generatePass(entrant: Entrant) -> Pass {
        // finalPass will be assigned with a pass to be returned
        var finalPass = Pass(entrantType: entrant.entrantType)
        
        switch entrant.entrantType {
        case .ClassicGuest:
            // Creating an instance of ClassicGuest
            let classicGuest = ClassicGuest()
            // Using the instance properties of ClassicGuest to construct a pass
            var pass = Pass(entrantType: classicGuest.entrantType)
            pass.rideAccess = classicGuest.rideAccess
            pass.areaAccess = classicGuest.areaAccess
            
            finalPass = pass
            
        case .VIPGuest:
            let vipGuest = VIPGuest()
            var pass = Pass(entrantType: vipGuest.entrantType)
            pass.rideAccess = vipGuest.rideAccess
            pass.areaAccess = vipGuest.areaAccess
            
            finalPass = pass
            
        case .ChildGuest:
            do {
                let childGuest = try ChildGuest(dateOfBirth: entrant.dateOfBirth)
                var pass = Pass(entrantType: childGuest.entrantType, dateOfBirth: entrant.dateOfBirth)
                pass.rideAccess = childGuest.rideAccess
                pass.areaAccess = childGuest.areaAccess
                
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .SeasonPassGuest:
            do {
                // Creating an instance
                let seasonPassGuest = try SeasonPassGuest(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode)
                // Constructing a pass
                var pass = Pass(firstName: seasonPassGuest.firstName, lastName: seasonPassGuest.lastName, entrantType: seasonPassGuest.entrantType, dateOfBirth: seasonPassGuest.dateOfBirth, discountOnFood: seasonPassGuest.discountOnFood, discountOnMerchandise: seasonPassGuest.discountOnMerchandise)
                pass.rideAccess = seasonPassGuest.rideAccess
                pass.areaAccess = seasonPassGuest.areaAccess
                
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .SeniorGuest:
            do {
                // Creating an instance
                let seniorGuest = try SeniorGuest(firstName: entrant.firstName, lastName: entrant.lastName, dateOfBirth: entrant.dateOfBirth)
                // Constructing a pass
                var pass = Pass(firstName: seniorGuest.firstName, lastName: seniorGuest.lastName, entrantType: seniorGuest.entrantType, dateOfBirth: seniorGuest.dateOfBirth)
                pass.rideAccess = seniorGuest.rideAccess
                pass.areaAccess = seniorGuest.areaAccess
                
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .FoodServiceEmployee:
            do {
                // Creating an instance
                let foodServiceEmployee = try FoodServiceEmployee(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode, entrantType: entrant.entrantType, dateOfBirth: entrant.dateOfBirth)
                // Constructing a pass
                var pass = Pass(firstName: foodServiceEmployee.firstName, lastName: foodServiceEmployee.lastName, entrantType: foodServiceEmployee.entrantType, dateOfBirth: foodServiceEmployee.dateOfBirth)
                pass.rideAccess = foodServiceEmployee.rideAccess
                pass.areaAccess = foodServiceEmployee.areaAccess
                
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .RideServiceEmployee:
            do {
                // Creating an instance
                let rideServiceEmployee = try RideServiceEmployee(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode, entrantType: entrant.entrantType, dateOfBirth: entrant.dateOfBirth)
                // Constructing a pass
                var pass = Pass(firstName: rideServiceEmployee.firstName, lastName: rideServiceEmployee.lastName, entrantType: rideServiceEmployee.entrantType)
                pass.rideAccess = rideServiceEmployee.rideAccess
                pass.areaAccess = rideServiceEmployee.areaAccess
                
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .MaintenanceEmployee:
            do {
                // Creating an instance
                let maintenanceEmployee = try MaintenanceEmployee(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode, entrantType: entrant.entrantType, dateOfBirth: nil)
                // Constructing a pass
                var pass = Pass(firstName: maintenanceEmployee.firstName, lastName: maintenanceEmployee.lastName, entrantType: maintenanceEmployee.entrantType)
                pass.rideAccess = maintenanceEmployee.rideAccess
                pass.areaAccess = maintenanceEmployee.areaAccess
                
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .Manager:
            do {
                // Creating an instance
                let manager = try Manager(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode, entrantType: entrant.entrantType, dateOfBirth: nil)
                // Constructing a pass
                var pass = Pass(firstName: manager.firstName, lastName: manager.lastName, entrantType: manager.entrantType)
                pass.rideAccess = manager.rideAccess
                pass.areaAccess = manager.areaAccess
                
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .ContractEmployee:
            do {
                // Creating an instance
                let contractEmployee = try ContractEmployee(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode, entrantType: entrant.entrantType, projectNumber: entrant.projectNumber)
                // Constructing a pass
                var pass = Pass(firstName: contractEmployee.firstName, lastName: contractEmployee.lastName, streetAddress: contractEmployee.streetAddress, city: contractEmployee.city, state: contractEmployee.state, zipCode: contractEmployee.zipCode, entrantType: contractEmployee.entrantType, dateOfBirth: nil)
                pass.rideAccess = contractEmployee.rideAccess
                pass.areaAccess = contractEmployee.areaAccess
                
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .Vendor:
            do {
                // Creating an instance
                let vendor = try Vendor(firstName: entrant.firstName, lastName: entrant.lastName, entrantType: entrant.entrantType, vendorCompany: entrant.vendorCompany, dateOfBirth: entrant.dateOfBirth, dateOfVisit: entrant.dateOfVisit)
                // Constructing a pass
                var pass = Pass(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode, entrantType: entrant.entrantType, dateOfBirth: entrant.dateOfBirth, discountOnFood: entrant.discountOnFood, discountOnMerchandise: entrant.discountOnMerchandise, projectNumber: entrant.projectNumber, vendorCompany: entrant.vendorCompany, dateOfVisit: entrant.dateOfVisit)
                pass.rideAccess = vendor.rideAccess
                pass.areaAccess = vendor.areaAccess
                
                finalPass = pass
            } catch {
                print(error)
            }
        }
        return finalPass
    }
    
    
    // Method to check the pass and allow entry to areas
    // Equivalent to Swipe method, This method can handle all type of passes
    static func checkPassForAreaAccess(pass: inout Pass, to area: AreaAccess) {
        
        if pass.areaAccess.contains(area) {
            // Extra credit, preventing swipe
            // if pass is already swiped, pass.swipe is not nil
            // prevent new swipes sooner than 5 seconds
            if let registeredSwipeTime = pass.swipeTime {
                let currentTime = Date()
                let registeredSwipeTimePlusDelay = registeredSwipeTime.addingTimeInterval(delayInSeconds)
                if currentTime < registeredSwipeTimePlusDelay {
                    print("Alert: Your pass has just been swiped, Try again later...")
                    print("Current Time: \(currentTime)")
                    print("Last Swipe  : \(registeredSwipeTime)")
                } else {
                    pass.swipeTime = currentTime
                    print("\(pass.entrantType) --- Allowed entry to \(area) at \(pass.swipeTime!)")
                }
            // if pass is not swiped yet, pass.swipe is nil
            // current time will be assigned to pass.swipeTime and allow entry
            } else {
                pass.swipeTime = Date()
                print("Pass swiped at: \(pass.swipeTime!)")
                print("\(pass.entrantType) --- Allowed entry to \(area) at \(pass.swipeTime!)")
            }
            
            // Extra credit , birthday message
            if pass.dateOfBirth != nil {
                let today = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "dd.MM.yy"
                let formattedDateOfBirth = formatter.string(from: pass.dateOfBirth!)
                let formattedToday = formatter.string(from: today)
                
                // first 5 characters are needed to check the birthday with the following format -> dd.MM
                if formattedDateOfBirth.prefix(numberOfCharacters) == formattedToday.prefix(numberOfCharacters) {
                    if let firstNameUnwrapped = pass.firstName {
                        print("Happy Birthday Dear \(firstNameUnwrapped)")
                    } else {
                        print("Happy Birthday Dear \(pass.entrantType)")
                    }
                }
            }
        
        } else {
            print("\(pass.entrantType) --- Denied entry to \(area)")
        }
    }
    
}


