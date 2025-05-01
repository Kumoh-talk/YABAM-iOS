import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            StoreListView(stores: StoreSampleData.storeList)
        }
    }
}
