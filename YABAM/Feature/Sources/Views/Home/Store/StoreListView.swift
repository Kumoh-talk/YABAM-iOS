import SwiftUI
import Network

struct StoreListView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var viewModel: StoreListViewModel
    @State private var showErrorAlert = false
    
    init(viewModel: StoreListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.storeList.storeInfos) { store in
                        storeRow(for: store)
                    }
                }
            }
        }
        .onAppear {
            Task { await viewModel.fetchInitialStoreList() }
        }
        .alert("오류 발생", isPresented: $showErrorAlert) {
            Button("확인", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage ?? "알 수 없는 오류")
        }
    }
    
    @ViewBuilder
    private func storeRow(for store: StoreInfo) -> some View {
        NavigationLink(destination: StoreDetailView()) {
            StoreRowView(store: store, userLocation: locationManager.userLocation)
                .padding(.horizontal)
                .onAppear {
                    if store == viewModel.storeList.storeInfos.last {
                        Task { await viewModel.fetchNextPage() }
                    }
                }
        }
    }
}
