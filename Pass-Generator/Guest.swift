//
//  Guests.swift
//  Pass-Generator
//
//  Created by Ehsan on 11/02/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

import Foundation

class Guest: Entrant {
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var entrantType: EntrantType
    var areaAccess: [AreaAccess] = [.amusementAreas]
    var rideAccess: [RideAccess] = [.accessAllRides]
    var dateOfBirth: Date?
    var discountOnFood: Int?
    var discountOnMerchandise: Int?
    var projectNumber: Int?
    var vendorCompany: VendorCompany?
    var dateOfVisit: Date?
    
    
    // TODO:
    // Optionals have to be unwrapped first, what I have is not a correct init
    // Some guests can't have names and etc, some can: SeasonPassGuest and senior
    init(firstName: String? = nil, lastName: String? = nil, streetAddress: String? = nil, city: String? = nil, state: String? = nil, zipCode: String? = nil, entrantType: EntrantType, dateOfBirth: Date? = nil, discountOnFood: Int? = nil, discountOnMerchandise: Int? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.entrantType = entrantType
        self.dateOfBirth = dateOfBirth
        self.discountOnFood = discountOnFood
        self.discountOnMerchandise = discountOnMerchandise
    }
    
}

// Used for Adult and Senior
class ClassicGuest: Guest {
    init(entrantType: EntrantType = .ClassicGuest, dateOfBirth: Date? = nil) {
        super.init(entrantType: entrantType, dateOfBirth: dateOfBirth)
    }
}



class VIPGuest: Guest {
    init(entrantType: EntrantType = .VIPGuest, discountOnFood: Int? = 10, discountOnMerchandise: Int? = 20, dateOfBirth: Date? = nil) {
        super.init(entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.rideAccess = [.accessAllRides, .skipAllRides]
    }
}



class ChildGuest: Guest {
    let maxChildAge: Int = 5
    
    init(dateOfBirth: Date?, entrantType: EntrantType = .ChildGuest) throws {
        guard let dateOfBirthUnwrapped = dateOfBirth else {
            throw InitializerError.missingDateOfBirth
        }
        
        super.init(entrantType: entrantType, dateOfBirth: dateOfBirthUnwrapped)
        
        
        let calendar = Calendar.current
        let ageComponent = calendar.dateComponents([.year], from: dateOfBirthUnwrapped , to: Date())
        
        if let ageComponentUnwrapped = ageComponent.year {
            if ageComponentUnwrapped <= maxChildAge {
                self.dateOfBirth = dateOfBirthUnwrapped
            } else {
                throw InitializerError.olderThanAgeLimit
            }
        }
    }
}


class SeasonPassGuest: Guest {
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .SeasonPassGuest, discountOnFood: Int? = 10, discountOnMerchandise: Int? = 20, dateOfBirth: Date? = nil) throws {
         super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.rideAccess = [.accessAllRides, .skipAllRides]
    }
}


class SeniorGuest: Guest {
    init(firstName: String?, lastName: String?, entrantType: EntrantType = .SeniorGuest, dateOfBirth: Date?, discountOnFood: Int? = 10, discountOnMerchandise: Int? = 10) throws {
        super.init(firstName: firstName, lastName: lastName, entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.rideAccess = [.accessAllRides, .skipAllRides]
    }
}
