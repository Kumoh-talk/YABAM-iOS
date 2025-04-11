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
}

struct SampleData {
    static let menuSections: [MenuSection] = [
        MenuSection(
            id: "추천",
            title: "추천 메뉴",
            items: [
                MenuItem(name: "우삼겹 야미볶음밥", description: "우삼겹과 볶음밥의 만남", price: 9500, imageName: "menu1"),
                MenuItem(name: "대패삼겹 야미볶음밥", description: "대패삼겹과 특제소스", price: 9500, imageName: "menu2"),
                MenuItem(name: "대패삼겹 야미볶음밥", description: "대패삼겹과 특제소스", price: 9500, imageName: "menu2"),
                MenuItem(name: "대패삼겹 야미볶음밥", description: "대패삼겹과 특제소스", price: 9500, imageName: "menu2"),
                MenuItem(name: "우삼겹 야미볶음밥", description: "우삼겹과 볶음밥의 만남", price: 9500, imageName: "menu1"),
                MenuItem(name: "우삼겹 야미볶음밥", description: "우삼겹과 볶음밥의 만남", price: 9500, imageName: "menu1"),
                MenuItem(name: "대패삼겹 야미볶음밥", description: "대패삼겹과 특제소스", price: 9500, imageName: "menu2"),
                MenuItem(name: "대패삼겹 야미볶음밥", description: "대패삼겹과 특제소스", price: 9500, imageName: "menu2"),
                MenuItem(name: "대패삼겹 야미볶음밥", description: "대패삼겹과 특제소스", price: 9500, imageName: "menu2"),
                MenuItem(name: "대패삼겹 야미볶음밥", description: "대패삼겹과 특제소스", price: 9500, imageName: "menu2"),
                MenuItem(name: "대패삼겹 야미볶음밥", description: "대패삼겹과 특제소스", price: 9500, imageName: "menu2"),
            ]
        ),
        MenuSection(
            id: "김치",
            title: "김치볶음밥",
            items: [
                MenuItem(name: "우삼겹 김치볶음밥", description: "우삼겹 + 김치 조합", price: 9500, imageName: "menu3"),
                MenuItem(name: "대패삼겹 김치볶음밥", description: "대패삼겹 + 김치", price: 9500, imageName: "menu4")
            ]
        ),
        MenuSection(
            id: "rrrrr",
            title: "qweqweqweqw",
            items: [
                MenuItem(name: "우삼겹 김치볶음밥", description: "우삼겹 + 김치 조합", price: 9500, imageName: "menu3"),
                MenuItem(name: "대패삼겹 김치볶음밥", description: "대패삼겹 + 김치", price: 9500, imageName: "menu4")
            ]
        ),
        MenuSection(
            id: "tttt",
            title: "qwe",
            items: [
                MenuItem(name: "우삼겹 김치볶음밥", description: "우삼겹 + 김치 조합", price: 9500, imageName: "menu3"),
                MenuItem(name: "대패삼겹 김치볶음밥", description: "대패삼겹 + 김치", price: 9500, imageName: "menu4")
            ]
        )
    ]
}
