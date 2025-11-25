import SwiftUI

struct SlotPinView: View {
    let state: OccupancyState

    var body: some View {
        let color: Color = {
            switch state {
            case .free: return .green
            case .occupied: return .red
            case .unknown: return .gray
            }
        }()

        Circle()
            .fill(color)
            .frame(width: 14, height: 14)
            .overlay(Circle().stroke(.white, lineWidth: 1))
            .shadow(radius: 2)
    }
}
