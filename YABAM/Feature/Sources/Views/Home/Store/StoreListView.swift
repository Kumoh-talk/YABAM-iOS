import SwiftUI

struct StoreListView: View {
    let stores: [Store]
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(stores) { store in
                        NavigationLink(destination: StoreDetailView(store: store)) {
                            StoreRowView(store: store, userLocation: locationManager.userLocation)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}
