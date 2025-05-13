public enum OrderMenuStatus: String, Decodable {
    case cooking = "COOKING"
    case completed = "COMPLETED"
    case canceled = "CANCELED"
    case received = "RECEIVED"
}
