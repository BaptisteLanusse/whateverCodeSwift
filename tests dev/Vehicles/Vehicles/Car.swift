//
//  Car.swift
//  Vehicles
//
//  Created by Lanusse Baptiste on 24/08/2015.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import Foundation

class Car: Vehicle {
    
    let isConvertible:Bool
    let isHatchBack:Bool
    let hasSunroof:Bool
    let numberOfDoors:Int
    
    init(brandName: String, modelName: String, modelYear: Int, powerSource: String, isConvertible: Bool, isHatchback: Bool, hasSunroof: Bool, numberOfDoors: Int) {
        self.isConvertible = isConvertible
        self.isHatchBack = isHatchback
        self.hasSunroof = hasSunroof
        self.numberOfDoors = numberOfDoors
        
        super.init(brandName: brandName, modelName: modelName, modelYear: modelYear, powerSource: powerSource, numberOfWheels: 4)
    }
    
    override var vehicleDetails: String {
        let basicDetails = super.vehicleDetails
        
        var carDetailsBuilder = "\nCar-Specific Details:\n\n"
        
        let yes = "Yes\n"
        let no = "No\n"
        
        carDetailsBuilder += "Has sunroof: "
        carDetailsBuilder += hasSunroof ? yes : no
        
        carDetailsBuilder += "Is HatchBack: "
        carDetailsBuilder += isHatchBack ? yes : no
        
        carDetailsBuilder += "Is Convertible: "
        carDetailsBuilder += isConvertible ? yes : no
        
        carDetailsBuilder += "number of doors: \(numberOfDoors)"
        
        let carDetails = basicDetails + carDetailsBuilder
        
        return carDetails
    }
    
    private func start() -> String {
        return String(format: "Start power source %@.", powerSource)
    }
    
    override func goForward() -> String {
        return String(format: "%@ %@ Then depress gas pedal.", start(), changeGears("Forward"))
    }
    
    override func goBackward() -> String {
        return String(format: "%@ %@ Check your rear view mirror. Then depress gas pedal.", start(), changeGears("Reverse"))
    }
    
    override func stopMoving() -> String {
        return String(format: "Depress brake pedal. %@", changeGears("Park"))
    }
    
    override func makeNoise() -> String {
        return "Beep beep!"
    }
    
}