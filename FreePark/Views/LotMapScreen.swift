import SwiftUI
import MapKit

struct LotMapScreen: View {
    @StateObject private var vm = LotMapViewModel()
    @State private var region: MKCoordinateRegion

    init() {
        // compute center from LotData.lot.corners
        let c = LotMapScreen.computeCenter(from: LotData.lot.corners)

        _region = State(initialValue: MKCoordinateRegion(
            center: c,
            span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        ))
    }

    var body: some View {
        ZStack(alignment: .top) {

            Map(coordinateRegion: $region)
                .ignoresSafeArea()

            VStack(spacing: 6) {
                Text(vm.lot.name)
                    .font(.headline)

                Text("\(vm.freeCount) free / \(vm.totalCount) total")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .padding(.top, 12)
        }
    }

    // MARK: - local helper (no Lot.center needed)
    private static func computeCenter(from corners: [Coordinate]) -> CLLocationCoordinate2D {
        let lats = corners.map { $0.latitude }
        let lons = corners.map { $0.longitude }

        return CLLocationCoordinate2D(
            latitude: (lats.min()! + lats.max()!) / 2,
            longitude: (lons.min()! + lons.max()!) / 2
        )
    }
}
