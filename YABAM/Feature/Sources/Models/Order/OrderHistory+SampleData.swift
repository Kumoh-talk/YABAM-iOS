import Foundation

struct OrderHistorySampleData {
    static let orders: [OrderHistory] = [
        OrderHistory(
            id: UUID(),
            orderDate: Date(timeIntervalSinceNow: -86400 * 2), // 2일 전
            storeName: "컵스엔식스피엠 옥계산동점",
            storeProfileImageUrl: "https://example.com/store_logo_1.png",
            totalMenuCount: 4,
            totalPrice: 36320,
            orderedMenus: [
                OrderedMenu(name: "(NEW)삼겹김치덮밥", quantity: 1),
                OrderedMenu(name: "된장찌개", quantity: 1),
                OrderedMenu(name: "계란찜", quantity: 1),
                OrderedMenu(name: "콜라", quantity: 1)
            ],
            canWriteReview: true,
            reviewDeadline: Calendar.current.date(byAdding: .day, value: 2, to: Date(timeIntervalSinceNow: -86400 * 2))!
        ),
        OrderHistory(
            id: UUID(),
            orderDate: Date(timeIntervalSinceNow: -86400 * 5), // 5일 전
            storeName: "치킨나라 옥계점",
            storeProfileImageUrl: "https://example.com/store_logo_2.png",
            totalMenuCount: 2,
            totalPrice: 18900,
            orderedMenus: [
                OrderedMenu(name: "양념치킨", quantity: 1),
                OrderedMenu(name: "감자튀김", quantity: 1)
            ],
            canWriteReview: false,
            reviewDeadline: Calendar.current.date(byAdding: .day, value: 2, to: Date(timeIntervalSinceNow: -86400 * 5))!
        )
    ]
}
