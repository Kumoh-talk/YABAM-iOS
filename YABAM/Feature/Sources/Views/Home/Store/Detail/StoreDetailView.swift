import SwiftUI

struct StoreDetailView: View {
    let store: Store
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTab: StoreDetailTab = .info
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TabView {
                ForEach(store.storeImageUrls, id: \.self) { urlString in
                    Image(.yabamFillLogo) // TODO: URL 이미지로 변경
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 200)
            
            VStack(alignment: .leading, spacing: 0) {
                YBText(store.name, fontType: .boldHeader3, color: .Neutral.neutral900)
                
                YBText(store.description, fontType: .mediumBody2, color: .Neutral.neutral600)
                                    
                HStack(spacing: 4) {
                    YBText(store.isOpen ? "영업 중" : "영업 종료", fontType: .boldBody2, color: .Neutral.neutral800)
                    
                    YBText("·", fontType: .boldBody1, color: .Neutral.neutral600)
                    
                    YBText("리뷰 수 \(store.reviewCount)", fontType: .mediumBody2, color: .Neutral.neutral800)
                    
                    YBText("·", fontType: .boldBody1, color: .Neutral.neutral600)
                    
                    HStack(spacing: 0) {
                        Image(.star).resizable().frame(width: 16, height: 16)
                        
                        YBText("\(store.review)", fontType: .mediumBody2, color: .Neutral.neutral800)
                    }
                }
                
                YBDivider(color: .Neutral.neutral300, height: 8)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(StoreDetailTab.allCases, id: \.self) { tab in
                        Button(action: {
                            selectedTab = tab
                        }) {
                            YBText(
                                tab.title,
                                fontType: .boldBody1,
                                color: selectedTab == tab ? .blue : .gray
                            )
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(selectedTab == tab ? Color.blue.opacity(0.1) : Color.clear)
                            .cornerRadius(16)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 12)
            }
            
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
