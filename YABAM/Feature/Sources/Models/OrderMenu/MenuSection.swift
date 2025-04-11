import Foundation

struct MenuSection: Identifiable {
    let id: String
    let title: String
    let items: [MenuItem]
}

struct MenuItem: Identifiable {
    let id: UUID = UUID()
    let name: String
    let description: String
    let price: Int
    let imageName: String
    let isRecommended: Bool
}

struct SampleData {
    static let menuSections: [MenuSection] = [
        MenuSection(
            id: "추천",
            title: "추천 메뉴",
            items: [
                MenuItem(name: "우삼겹 야미볶음밥", description: "우삼겹과 볶음밥의 만남", price: 9500, imageName: "menu1", isRecommended: true),
                MenuItem(name: "대패삼겹 야미볶음밥", description: "대패삼겹과 특제소스", price: 9500, imageName: "menu2", isRecommended: false),
                MenuItem(name: "대패삼겹 야미볶음밥", description: "대패삼겹과 특제소스", price: 9500, imageName: "menu2", isRecommended: true),
                MenuItem(name: "대패삼겹 야미볶음밥", description: "대패삼겹과 특제소스", price: 9500, imageName: "menu2", isRecommended: false),
                MenuItem(name: "우삼겹 야미볶음밥", description: "우삼겹과 볶음밥의 만남", price: 9500, imageName: "menu1", isRecommended: true),
                MenuItem(name: "우삼겹 야미볶음밥", description: "우삼겹과 볶음밥의 만남", price: 9500, imageName: "menu1", isRecommended: false),
                MenuItem(name: "대패삼겹 야미볶음밥", description: "대패삼겹과 특제소스", price: 9500, imageName: "menu2", isRecommended: true),
            ]
        ),
        MenuSection(
            id: "한식",
            title: "한식ㄱㄱㄱㄱㄱㄱㄱ",
            items: [
                MenuItem(name: "우삼겹 김치볶음밥", description: "우삼겹 + 김치 조합", price: 9500, imageName: "menu3", isRecommended: false),
                MenuItem(name: "대패삼겹 김치볶음밥", description: "대패삼겹 + 김치", price: 9500, imageName: "menu4", isRecommended: true)
            ]
        ),
        MenuSection(
            id: "일식",
            title: "일식ㄷㄷㄷㄷㄷㄷ",
            items: [
                MenuItem(name: "우삼겹 김치볶음밥", description: "우삼겹 + 김치 조합", price: 9500, imageName: "menu3", isRecommended: true),
                MenuItem(name: "대패삼겹 김치볶음밥", description: "대패삼겹 + 김치", price: 9500, imageName: "menu4", isRecommended: false)
            ]
        ),
        MenuSection(
            id: "양식",
            title: "양식ㄴㄴㄴㄴㄴㄴㄴ",
            items: [
                MenuItem(name: "우삼겹 김치볶음밥", description: "우삼겹 + 김치 조합", price: 9500, imageName: "menu3", isRecommended: false),
                MenuItem(name: "대패삼겹 김치볶음밥", description: "대패삼겹 + 김치", price: 9500, imageName: "menu4", isRecommended: true)
            ]
        )
    ]
}
