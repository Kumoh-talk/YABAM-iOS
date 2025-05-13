import SwiftUI
import Network

struct StoreListView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var viewModel: StoreListViewModel
    
    init(viewModel: StoreListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.storeList.storeInfoDtos) { store in
                        storeRow(for: store)
                    }
                }
            }
        }
        .onAppear {
            Task { await viewModel.fetchInitialStoreList() }
        }
    }

    @ViewBuilder
    private func storeRow(for store: StoreInfo) -> some View {
        NavigationLink(destination: StoreDetailView()) {
            StoreRowView(store: store, userLocation: locationManager.userLocation)
                .padding(.horizontal)
                .onAppear {
                    if store == viewModel.storeList.storeInfoDtos.last {
                        Task {
                            try await viewModel.fetchNextPage()
                        }
                    }
                }
        }
    }
}
