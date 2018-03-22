//
//  Model.swift
//  Pass-Generator
//
//  Created by Ehsan on 18/01/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

import Foundation
// All the enums and protocols are defined in this file


enum AreaAccess: String {
    case amusementAreas
    case kitchenAreas
    case rideControlAreas
    case maintenanceAreas
    case officeAreas
}


enum RideAccess {
    case accessAllRides
    case skipAllRides
}


// Enum for Initialization errors
enum InitializerError: Error {
    case missingDateOfBirth
    case missingFirstName
    case missingLastName
    case missingStreetAddress
    case missingCity
    case missingState
    case missingZipCode
    case olderThanAgeLimit
}

enum EntrantType: String {
    case ClassicGuest
    case VIPGuest
    case ChildGuest
    case FoodServiceEmployee
    case RideServiceEmployee
    case MaintenanceEmployee
    case Manager
}

// Protocol for Staff info
protocol StaffInfo {
    var firstName: String? { get set }
    var lastName: String? { get set }
    var streetAddress: String? { get set }
    var city: String? { get set }
    var state: String? { get set }
    var zipCode: String? { get set }
}

// Protocol to make a custom type Entrant
// Entrant is a protocol which requires all the properties
protocol Entrant: StaffInfo {
    var areaAccess: [AreaAccess] { get set }
    var rideAccess: [RideAccess] { get set }
    var entrantType: EntrantType { get set }
    var dateOfBirth: Date? { get set }
    var discountOnFood: Int? { get set }
    var discountOnMerchandise: Int? { get set }
}


protocol SwipeTime {
    var swipeTime: Date? { get set }
}


// Struct to hold uniform passes
struct Pass: Entrant, SwipeTime {
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var entrantType: EntrantType
    var rideAccess: [RideAccess] = []
    var areaAccess: [AreaAccess] = []
    var dateOfBirth: Date?
    var discountOnFood: Int?
    var discountOnMerchandise: Int?
    var swipeTime: Date? = nil
    
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

