struct Lot: Identifiable, Hashable {
    let id: String
    let name: String

    // Use our Coordinate wrapper, not CLLocationCoordinate2D
    let corners: [Coordinate]
    
    let totalSlots: Int
    var freeSlots: Int
    
    init(
        id: String,
        name: String,
        corners: [Coordinate],
        totalSlots: Int,
        freeSlots: Int
    ) {
        precondition(corners.count == 4, "Lot must have exactly 4 corners")
        self.id = id
        self.name = name
        self.corners = corners
        self.totalSlots = totalSlots
        self.freeSlots = freeSlots
    }
}
