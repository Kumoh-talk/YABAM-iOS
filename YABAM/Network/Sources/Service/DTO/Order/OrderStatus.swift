public enum OrderStatus: String, Decodable {
    case received = "RECEIVED"
    case accepted = "ACCEPTED"
    case completed = "COMPLETED"
    case canceled = "CANCELED"
}
