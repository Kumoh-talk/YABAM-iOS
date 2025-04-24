import SwiftUI
import Core

struct MenuCartView: View {
    @ObservedObject var cartManager: CartManager
    
    @State private var itemToDelete: MenuItem? = nil
    @State private var showDeleteAlert: Bool = false
    
    var body: some View {
        if cartManager.hasItems {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(cartManager.items) { item in
                        MenuItemView(item: item, onDelete: {
                            itemToDelete = item
                            showDeleteAlert = true
                        })
                        .padding(.horizontal, 16)
                        
                        YBDivider()
                            .padding(.vertical, 10)
                    }
                }
            }
            .alert("해당 메뉴를 삭제하시겠어요?", isPresented: $showDeleteAlert, actions: {
                Button("삭제", role: .destructive) {
                    if let item = itemToDelete {
                        cartManager.remove(item)
                        itemToDelete = nil
                    }
                }
                Button("취소", role: .cancel) {
                    itemToDelete = nil
                }
            }, message: {
                Text(itemToDelete?.name ?? "")
            })
        } else {
            YBText(
                "현재 담겨있는 메뉴가 없어요\n아래 메뉴추가를 눌러 메뉴를 담아주세요",
                fontType: .mediumBody1,
                color: .Neutral.neutral600
            )
            .multilineTextAlignment(.center)
        }
    }
}
