import SwiftUI

struct ReviewWriteView: View {
    @Binding var isPresented: Bool
    @State private var rating: Int = 0
    @State private var content: String = ""
    
    var onSave: (_ rating: Int, _ content: String) -> Void
    
    private var canSave: Bool {
        rating > 0 && !content.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 12) {
                YBText("별점을 선택해주세요", fontType: .boldHeader5, color: .Neutral.neutral900)
                
                HStack(spacing: 8) {
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: index <= rating ? "star.fill" : "star")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(index <= rating ? .yellow : .gray)
                            .onTapGesture {
                                rating = index
                            }
                    }
                }
                
                YBText("리뷰를 작성해주세요", fontType: .boldHeader5, color: .Neutral.neutral900)
                
                TextEditor(text: $content)
                    .frame(height: 160)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                
                Spacer()
            }
            .padding()
            .navigationTitle("리뷰 작성")
            .navigationBarTitleDisplayMode(.inline)
            .withNavigationButtons(
                leading: NavigationButtonConfig {
                    YBText("닫기", fontType: .mediumBody1, color: .Neutral.neutral800)
                } action: {
                    isPresented = false
                },
                trailing: NavigationButtonConfig {
                    YBText("저장", fontType: .boldBody1, color: canSave ? .Neutral.neutral800 : .Neutral.neutral300)
                } action: {
                    if canSave {
                        onSave(rating, content)
                        isPresented = false
                    }
                }
            )
        }
    }
}
