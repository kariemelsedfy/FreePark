//
//  Coordinate.swift
//  FreePark
//
//  Created by Karim ElSedfy on 11/24/25.
//

import Foundation
import CoreLocation

struct Coordinate: Codable, Hashable {
    let latitude: Double
    let longitude: Double
    
    var clLocation: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init(_ coord: CLLocationCoordinate2D) {
        self.latitude = coord.latitude
        self.longitude = coord.longitude
    }
}


