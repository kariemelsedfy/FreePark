//
//  LotData.swift
//  FreePark
//
//  Created by Karim ElSedfy on 11/24/25.
//

import Foundation

struct LotData {
    static let lot = Lot(
        id: "LotA",
        name: "Campus Lot",
        corners: [
            Coordinate(latitude: 43.905358, longitude: -69.964369), // top-left
            Coordinate(latitude: 43.905186, longitude: -69.964309), // top-right
            Coordinate(latitude: 43.905104, longitude: -69.964726), // bottom-right
            Coordinate(latitude: 43.905285, longitude: -69.964780)  // bottom-left
        ],
        totalSlots: 20,
        freeSlots: 7
    )
}
