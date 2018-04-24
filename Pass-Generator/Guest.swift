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
    
    init(firstName: String? = nil, lastName: String? = nil, streetAddress: String? = nil, city: String? = nil, state: String? = nil, zipCode: String? = nil, entrantType: EntrantType, dateOfBirth: Date? = nil, discountOnFood: Int? = nil, discountOnMerchandise: Int? = nil) {
        
        if let firstNameUnwrapped = firstName {
            self.firstName = firstNameUnwrapped
        }
        
        if let lastNameUnwrapped = lastName {
            self.lastName = lastNameUnwrapped
        }
        
        if let streetAddressUnwrapped = streetAddress {
            self.streetAddress = streetAddressUnwrapped
        }
        
        if let cityUnwrapped = city {
            self.city = cityUnwrapped
        }
        
        if let stateUnwrapped = state {
            self.state = stateUnwrapped
        }
        
        if let zipCodeUnwrapped = zipCode {
            self.zipCode = zipCodeUnwrapped
        }
        
        if let dateOfBirthUnwrapped = dateOfBirth {
            self.dateOfBirth = dateOfBirthUnwrapped
        }
        
        self.entrantType = entrantType
        self.discountOnFood = discountOnFood
        self.discountOnMerchandise = discountOnMerchandise
    }
    
}


class ClassicGuest: Guest {
    init(entrantType: EntrantType = .ClassicGuest, dateOfBirth: Date? = nil) {
        super.init(entrantType: entrantType, dateOfBirth: dateOfBirth)
    }
}


class VIPGuest: Guest {
    init(entrantType: EntrantType = .VIPGuest, dateOfBirth: Date? = nil) {
        super.init(entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.rideAccess = [.accessAllRides, .skipAllLines]
        self.discountOnFood = 10
        self.discountOnMerchandise = 20
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
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .SeasonPassGuest, dateOfBirth: Date? = nil) throws {
        
        guard let firstNameUnwrapped = firstName.nilIfEmpty else {
            throw InitializerError.missingFirstName
        }
        
        guard let lastNameUnwrapped = lastName.nilIfEmpty else {
            throw InitializerError.missingLastName
        }
        
        guard let streetAddressUnwrapped = streetAddress.nilIfEmpty else {
            throw InitializerError.missingStreetAddress
        }
        
        guard let cityUnwrapped = city.nilIfEmpty else {
            throw InitializerError.missingCity
        }
        
        guard let stateUnwrapped = state.nilIfEmpty else {
            throw InitializerError.missingState
        }
        
        guard let zipCodeUnwrapped = zipCode.nilIfEmpty else {
            throw InitializerError.missingZipCode
        }
        
        super.init(firstName: firstNameUnwrapped, lastName: lastNameUnwrapped, streetAddress: streetAddressUnwrapped, city: cityUnwrapped, state: stateUnwrapped, zipCode: zipCodeUnwrapped, entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.rideAccess = [.accessAllRides, .skipAllLines]
        self.discountOnFood = 10
        self.discountOnMerchandise = 20
    }
}


class SeniorGuest: Guest {
    init(firstName: String?, lastName: String?, entrantType: EntrantType = .SeniorGuest, dateOfBirth: Date?) throws {
        guard let firstNameUnwrapped = firstName.nilIfEmpty else {
            throw InitializerError.missingFirstName
        }
        
        guard let lastNameUnwrapped = lastName.nilIfEmpty else {
            throw InitializerError.missingLastName
        }
        
        guard let dateOfBirthUnwrapped = dateOfBirth else {
            throw InitializerError.missingDateOfBirth
        }
        
        super.init(firstName: firstNameUnwrapped, lastName: lastNameUnwrapped, entrantType: entrantType, dateOfBirth: dateOfBirthUnwrapped)
        self.rideAccess = [.accessAllRides, .skipAllLines]
        self.discountOnFood = 10
        self.discountOnMerchandise = 10
    }
}
