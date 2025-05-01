import SwiftUI

struct StoreListView: View {
    let stores: [Store]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            YBText(
                "가게 목록",
                fontType: .boldHeader1,
                color: .Neutral.neutral900
            )
            .padding(.top, 24)
            .padding(.horizontal)
            
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(stores) { store in
                        NavigationLink(destination: StoreDetailView(store: store)) {
                            StoreRowView(store: store)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}
