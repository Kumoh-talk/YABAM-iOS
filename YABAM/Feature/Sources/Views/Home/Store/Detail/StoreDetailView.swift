import SwiftUI

struct StoreDetailView: View {
    let store: Store
    @Environment(\.dismiss) private var dismiss
    @StateObject private var locationManager = LocationManager()
    
    @State private var selectedTab: StoreDetailTab = .menu
    @State private var isImageFullscreenPresented = false
    @State private var selectedImageIndex = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                StoreImageSliderView(
                    imageUrls: store.storeImageUrls,
                    selectedIndex: $selectedImageIndex,
                    isPresented: $isImageFullscreenPresented
                )
                
                StoreHeaderView(store: store, isDetail: true, userLocation: locationManager.userLocation)
                    .padding()

                YBDivider(color: .Neutral.neutral300, height: 8)

                StoreTabSelectorView(selectedTab: $selectedTab)
                    .padding(.vertical, 4)

                VStack(alignment: .leading, spacing: 16) {
                    switch selectedTab {
                    case .menu:
                        StoreMenuView(store: store, menuSections: MenuSectionSampleData.menuSections)
                    case .review:
                        StoreReviewView(store: store)
                    case .location:
                        StoreLocationView(store: store)
                    }
                }
                .padding(.top, 8)
            }
        }
        .fullScreenCover(isPresented: $isImageFullscreenPresented) {
            YBFullscreenImageViewer(
                imageUrls: store.storeImageUrls,
                initialIndex: selectedImageIndex
            )
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden()
        .withNavigationButtons(
            leading: NavigationButtonConfig {
                CircleIconButton(icon: Image(.popArrow))
            } action: {
                dismiss()
            }
        )
    }
}
