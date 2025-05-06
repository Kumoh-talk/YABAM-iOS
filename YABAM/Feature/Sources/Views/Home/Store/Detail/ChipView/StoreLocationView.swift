import SwiftUI
import MapKit

struct StoreLocationView: View {
    let store: Store

    @State private var region: MKCoordinateRegion

    init(store: Store) {
        self.store = store
        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: store.latitude, longitude: store.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        ))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Map(coordinateRegion: $region, annotationItems: [store]) { store in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: store.latitude, longitude: store.longitude)) {
                    VStack(spacing: 4) {
                        Image(.yabamFillLogo)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 3)

                        Image(systemName: "arrowtriangle.down.fill")
                            .font(.caption)
                            .foregroundColor(.blue)
                            .offset(y: -4)
                    }
                }
            }
            .frame(height: 240)
            .cornerRadius(12)
        }
        .padding(.horizontal)
    }
}
