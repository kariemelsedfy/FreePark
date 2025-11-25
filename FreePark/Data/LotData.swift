//
//  LotData.swift
//  FreePark
//
//  Created by Karim ElSedfy on 11/24/25.
//

import Foundation

struct LotData {

    // MARK: - Single Lot (replace corners with your real 4 coordinates)
    static let lot = Lot(
        id: "LotA",
        name: "Main Campus Lot A",
        corners: [
            Coordinate(latitude: 43.90650, longitude: -69.96350), // top-left
            Coordinate(latitude: 43.90650, longitude: -69.96310), // top-right
            Coordinate(latitude: 43.90610, longitude: -69.96310), // bottom-right
            Coordinate(latitude: 43.90610, longitude: -69.96350)  // bottom-left
        ],
        totalSlots: 20,
        freeSlots: 7
    )
}
