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


enum RideAccess: String {
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
    case missingProjectNumber
    case missingVendorCompany
    case missingDateOfVisit
    case invalidProjectNumber
}

enum EntrantType: String {
    case ClassicGuest
    case VIPGuest
    case ChildGuest
    case SeasonPassGuest
    case SeniorGuest
    case FoodServiceEmployee
    case RideServiceEmployee
    case MaintenanceEmployee
    case ContractEmployee
    case Manager
    case Vendor
}


enum VendorCompany: String {
    case Acme
    case Orkin
    case Fedex
    case NWElectrical
}


// Enum for top buttons in first row
enum FirstRowButtonType {
    case Guest
    case Employee
    case Manager
    case Vendor
}


// Enum for top buttons in second row
enum SecondRowButtonType {
    case Child
    case Adult
    case Senior
    case VIP
    case FoodService
    case RideService
    case Maintenance
    case Contract
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


protocol ContractInfo {
    var projectNumber: Int? { get set }
}


protocol VendorInfo {
    var vendorCompany: VendorCompany? { get set }
    var dateOfVisit: Date? { get set }
}


protocol DiscountInfo {
    var discountOnFood: Int? { get set }
    var discountOnMerchandise: Int? { get set }
}


// Protocol to make a custom type Entrant
// Entrant is a protocol which requires all the common properties
protocol Entrant: StaffInfo, ContractInfo, VendorInfo, DiscountInfo {
    var areaAccess: [AreaAccess] { get set }
    var rideAccess: [RideAccess] { get set }
    var entrantType: EntrantType { get set }
    var dateOfBirth: Date? { get set }
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
    var projectNumber: Int?
    var vendorCompany: VendorCompany?
    var dateOfVisit: Date?
    
    
    init(firstName: String? = nil, lastName: String? = nil, streetAddress: String? = nil, city: String? = nil, state: String? = nil, zipCode: String? = nil, entrantType: EntrantType, dateOfBirth: Date? = nil, discountOnFood: Int? = nil, discountOnMerchandise: Int? = nil, projectNumber: Int? = nil, vendorCompany: VendorCompany? = nil, dateOfVisit: Date? = nil) {
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
        self.projectNumber = projectNumber
        self.vendorCompany = vendorCompany
        self.dateOfVisit = dateOfVisit
    }
}

