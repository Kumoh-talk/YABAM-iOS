import SwiftUI
import Core

struct MenuCartScrollView: View {
    let isTemporary: Bool
    @State private var itemToDelete: MenuItem? = nil
    @State private var showDeleteAlert: Bool = false
    @ObservedObject var cartManager: CartManager
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Group {
            if cartManager.hasItems {
                ScrollView {
                    VStack(spacing: 0) {
                        let enumeratedItems = Array(cartManager.groupedItems.enumerated())

                        ForEach(enumeratedItems, id: \.element.item.id) { index, grouped in
                            MenuItemView(item: grouped.item, quantity: grouped.quantity, onDelete: {
                                itemToDelete = grouped.item
                                showDeleteAlert = true
                            })
                            .padding(.horizontal, 16)

                            if index != enumeratedItems.count - 1 {
                                YBDivider()
                                    .padding(.vertical, 10)
                            }
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
                .padding(.vertical, 40)
                .multilineTextAlignment(.center)
            }
        }
        .navigationTitle("장바구니")
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.automatic)
        .modifier(NavigationButtonModifier(isTemporary: isTemporary, dismiss: dismiss))
    }
}

private struct NavigationButtonModifier: ViewModifier {
    let isTemporary: Bool
    let dismiss: DismissAction
    
    func body(content: Content) -> some View {
        if isTemporary {
            content.withNavigationButtons(
                leading: NavigationButtonConfig {
                    Image(.popArrow)
                } action: {
                    dismiss()
                }
            )
        } else {
            content
        }
    }
}
