struct Slot: Identifiable, Codable, Hashable {
    let id: String
    var state: OccupancyState
}
