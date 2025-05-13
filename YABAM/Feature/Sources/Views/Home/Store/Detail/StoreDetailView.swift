import SwiftUI
import FirebaseAnalytics

struct StoreDetailView: View {
    let store: Store
    @Environment(\.dismiss) private var dismiss
    @StateObject private var locationManager = LocationManager()
    
    @State private var selectedTab: StoreDetailTab = .menu
    @State private var isImageFullscreenPresented = false
    @State private var selectedImageIndex = 0
    @State private var tabEnterTime: Date?
    
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
        .onAppear {
            Analytics.logEvent("screen_view", parameters: [
                "screen_name": "store_detail",
                "store_id": store.id,
                "store_name": store.name
            ])
            tabEnterTime = Date()
        }
        .onChange(of: selectedTab) { newTab in
            if let enterTime = tabEnterTime {
                let duration = Date().timeIntervalSince(enterTime)
                Analytics.logEvent("store_detail_tab_duration", parameters: [
                    "tab": newTab.rawValue,
                    "duration_sec": duration,
                    "store_id": store.id
                ])
            }
            
            Analytics.logEvent("store_detail_tab_changed", parameters: [
                "tab": newTab.rawValue,
                "store_id": store.id
            ])
            
            tabEnterTime = Date() // 새로운 탭 체류 시작 시간 갱신
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
                YBCircleIconButton(icon: Image(.popArrow))
            } action: {
                dismiss()
            }
        )
    }
}
