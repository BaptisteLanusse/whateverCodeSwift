//
//  MotorCycle.swift
//  Vehicles
//
//  Created by Lanusse Baptiste on 24/08/2015.
//  Copyright © 2015 Razeware, LLC. All rights reserved.
//

import Foundation

class MotorCycle: Vehicle {
    let engineNoise: String
    
    
    
    init(brandName: String, modelName: String, modelYear: Int, engineNoise: String) {
        
        self.engineNoise = engineNoise
        
        super.init(brandName: brandName, modelName: modelName, modelYear: modelYear, powerSource: "gas engine", numberOfWheels: 2)
    }
    
    override func goForward() -> String {
        return String(format: "%@ Open throttle.", changeGears("Forward"))
    }
    
    override func goBackward() -> String {
        return String(format: "%@ Walk %@ backwards using feet.", changeGears("Neutral"), modelName)
    }
    
    override func stopMoving() -> String {
        return "Squeeze brakes"
    }
    
    override func makeNoise() -> String {
        return self.engineNoise
    }
    
    override var vehicleDetails: String {
        let basicDetails = super.vehicleDetails
        
        var motorcycleDetailsBuilder = "\nMotorcycle-Specific Details:\n\n"
        
        motorcycleDetailsBuilder += "Engine Noise: \(engineNoise)"
        
        let motorcycleDetails = basicDetails + motorcycleDetailsBuilder
        
        return motorcycleDetails
    }
    
}