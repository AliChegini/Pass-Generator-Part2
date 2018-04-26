//
//  Staff.swift
//  Pass-Generator
//
//  Created by Ehsan on 11/02/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

import Foundation

// Base class for Employees
class Employee: Entrant {
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var entrantType: EntrantType
    var areaAccess: [AreaAccess] = []
    var rideAccess: [RideAccess] = [.accessAllRides]
    var dateOfBirth: Date?
    var discountOnFood: Int? = 15
    var discountOnMerchandise: Int? = 25
    var projectNumber: Int?
    var vendorCompany: VendorCompany?
    var dateOfVisit: Date?
    
    
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType, dateOfBirth: Date?, projectNumber: Int? = nil) throws {
        
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
        
        // DateOfBirth is not mandatory for employees, so
        // we don't halt the program execution if date is missing
        if let dateOfBirthUnwrapped = dateOfBirth {
            self.dateOfBirth = dateOfBirthUnwrapped
        }
        
        self.firstName = firstNameUnwrapped
        self.lastName = lastNameUnwrapped
        self.streetAddress = streetAddressUnwrapped
        self.city = cityUnwrapped
        self.state = stateUnwrapped
        self.zipCode = zipCodeUnwrapped
        self.entrantType = entrantType
        self.projectNumber = projectNumber
    }
}


class FoodServiceEmployee: Employee {
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .FoodServiceEmployee, dateOfBirth: Date?) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.areaAccess = [.amusementAreas, .kitchenAreas]
    }
}


class RideServiceEmployee : Employee {
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .RideServiceEmployee, dateOfBirth: Date?) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.areaAccess = [.amusementAreas, .rideControlAreas]
    }
}


class MaintenanceEmployee: Employee {
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .MaintenanceEmployee , dateOfBirth: Date?) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.areaAccess = [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas]
    }
}

// TODO: Birthday message does not work for manager and employees, works only for child

class Manager: Employee {
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .Manager , dateOfBirth: Date?) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.areaAccess = [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas, .officeAreas]
        self.discountOnFood = 25
        self.discountOnMerchandise = 25
    }
}


class ContractEmployee: Employee {
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .ContractEmployee, projectNumber: Int?, dateOfBirth: Date?) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType, dateOfBirth: dateOfBirth, projectNumber: projectNumber)
        self.rideAccess = []
        
        guard let projectNumberUnwrapped = projectNumber else {
            throw InitializerError.missingProjectNumber
        }
        
        switch projectNumberUnwrapped {
        case 1001:
            self.areaAccess = [.amusementAreas, .rideControlAreas]
        case 1002:
            self.areaAccess = [.amusementAreas, .rideControlAreas, .maintenanceAreas]
        case 1003:
            self.areaAccess = [.amusementAreas, .rideControlAreas, .kitchenAreas, .maintenanceAreas, .officeAreas]
        case 2001:
            self.areaAccess = [.officeAreas]
        case 2002:
            self.areaAccess = [.kitchenAreas, .maintenanceAreas]
        default:
            throw InitializerError.invalidProjectNumber
        }
    }
    
}

