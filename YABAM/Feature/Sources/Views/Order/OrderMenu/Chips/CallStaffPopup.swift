import SwiftUI

struct CallStaffPopup: View {
    @Binding var showPopup: Bool
    @State private var selectedText = ""
    @State private var selectedOption: String? = nil
    
    let options = ["물", "앞접시", "휴지", "물티슈", "숟가락", "젓가락", "소주컵", "종이컵"]
    
    var body: some View {
        VStack(spacing: 16) {
            YBText("직원 호출하기", fontType: .boldHeader3, color: .Neutral.neutral800)
                .padding(.top)
                .padding(.bottom, 4)
            
            YBFlowLayout(spacing: 4, lineSpacing: 6) {
                ForEach(options, id: \.self) { option in
                    MenuChip(
                        title: option,
                        isSelected: selectedOption == option,
                        action: {
                            selectedOption = option
                            selectedText = "\(option) 주세요!"
                        }
                    )
                }
            }
            
            TextField("요청사항을 적어주세요!", text: $selectedText)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal, 4)
            
            HStack(spacing: 0) {
                Button(action: {
                    showPopup = false
                }) {
                    VStack {
                        YBText("취소", fontType: .mediumBody1, color: .red)
                    }
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .contentShape(Rectangle())
                }

                Button(action: {
                    print("요청사항: \(selectedText)")
                    showPopup = false
                }) {
                    VStack {
                        YBText("저장", fontType: .mediumBody1, color: .blue)
                    }
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .contentShape(Rectangle())
                }
            }
            .cornerRadius(12)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4))
        .edgesIgnoringSafeArea(.all)
    }
}
