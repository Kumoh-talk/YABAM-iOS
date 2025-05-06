import SwiftUI

struct StoreDetailView: View {
    let store: Store
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTab: StoreDetailTab = .info
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            StoreImageSliderView(imageUrls: store.storeImageUrls)
            
            VStack(alignment: .leading, spacing: 0) {
                StoreHeaderView(store: store, isDetail: true, userLocation: locationManager.userLocation).padding()
                
                YBDivider(color: .Neutral.neutral300, height: 8)
            }

            StoreTabSelectorView(selectedTab: $selectedTab)
            
            YBDivider()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    switch selectedTab {
                    case .info:
                        StoreInfoView(store: store)
                    case .menu:
                        StoreMenuView(store: store)
                    case .review:
                        StoreReviewView(store: store)
                    case .location:
                        StoreLocationView(store: store)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
        }
        .navigationTitle(store.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .withNavigationButtons(
            leading: NavigationButtonConfig {
                Image(.popArrow)
            } action: {
                dismiss()
            }
        )
    }
}
