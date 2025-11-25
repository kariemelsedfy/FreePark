import SwiftUI
import MapKit

struct LotMapScreen: View {
    @StateObject private var vm = LotMapViewModel()

    @State private var cameraPosition: MapCameraPosition

    init() {
        let lot = LotData.lot
        let center = LotMapScreen.center(from: lot.corners)
        let region = MKCoordinateRegion(
            center: center,
            span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        )
        _cameraPosition = State(initialValue: .region(region))
    }

    var body: some View {
        let lot = vm.lot
        let coords = lot.corners.map { $0.clLocation }
        let center = LotMapScreen.center(from: lot.corners)

        Map(position: $cameraPosition) {

            // 1) Rectangle overlay of the lot
            MapPolygon(coordinates: coords)
                .foregroundStyle(.green.opacity(0.18))
                .stroke(.green, lineWidth: 2)

            // 2) Label over the lot showing "free / total"
            Annotation("", coordinate: center) {
                VStack(spacing: 4) {
                    Text(lot.name)
                        .font(.caption2)
                        .foregroundStyle(.white.opacity(0.8))

                    Text("\(vm.freeCount) / \(vm.totalCount)")
                        .font(.headline)
                        .bold()
                        .foregroundStyle(.white)
                }
                .padding(8)
                .background(.green.opacity(0.9))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 4)
            }
        }
        .ignoresSafeArea()
    }

    // MARK: - Helpers

    static func center(from corners: [Coordinate]) -> CLLocationCoordinate2D {
        let lats = corners.map { $0.latitude }
        let lons = corners.map { $0.longitude }

        return CLLocationCoordinate2D(
            latitude: (lats.min()! + lats.max()!) / 2,
            longitude: (lons.min()! + lons.max()!) / 2
        )
    }
}
