import CoreLocation

struct StoreDetail: Hashable, Identifiable {
    let id: Int
    let university: String
    let name: String
    let description: String
    let logoImageUrl: String
    let storeImageUrls: [String]
    let review: Double
    let reviewCount: Int
    let latitude: Double
    let longitude: Double
    let isOpen: Bool
    
    var location: CLLocation {
        CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func distance(from userLocation: CLLocation) -> String {
        let distanceInMeters = userLocation.distance(from: location)
        let distanceInKilometers = distanceInMeters / 1000
        return String(format: "%.1fkm", distanceInKilometers)
    }
}

// MARK: - StoreDetail + StorePresentable
extension StoreDetail: StorePresentable {
    var storeTitle: String { name }
    var storeDescription: String { description }
    var reviewAverage: Double { review }
}
