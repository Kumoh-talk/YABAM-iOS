import Core
import Foundation
import Network

struct Review: Identifiable, Hashable {
    let id: Int
    let userNickname: String
    let rating: Double
    let content: String
    let createdAt: String
    
    init(from dto: ReviewInfoDto) {
        self.id = Int(dto.reviewId)
        self.userNickname = dto.userNickname
        self.rating = Double(dto.rating) / 10.0
        self.content = dto.content
        self.createdAt = dto.createdAt
    }
}
