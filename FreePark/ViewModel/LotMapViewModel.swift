import SwiftUI
import Combine

@MainActor
final class LotMapViewModel: ObservableObject {
    @Published var lot: Lot

    init() {
        self.lot = LotData.lot
    }

    var freeCount: Int { lot.freeSlots }
    var totalCount: Int { lot.totalSlots }

    // optional demo helpers
    func setFreeSlots(_ newValue: Int) {
        lot.freeSlots = max(0, min(newValue, lot.totalSlots))
    }

    func randomizeFreeSlots() {
        lot.freeSlots = Int.random(in: 0...lot.totalSlots)
    }
}
