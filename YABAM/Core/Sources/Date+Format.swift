import Foundation

// MARK: - Date <-> String 타입변환 Extension
public extension Date {
    
    /// String을 Format을 지정하여 Date?으로 변환합니다.
    ///
    /// - Date.convertToDate(format: .yearMonth)
    /// - Parameters:
    ///   - format: DateFormatType으로 직접 format을 지정할 수 있음
    /// - Returns: Date? 타입으로 반환
    static func convertFromString(_ date: String, format: DateFormatType) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.formatter.dateFormat
        return dateFormatter.date(from: date)
    }
    
    /// Date을 Format을 지정하여 String 타입으로 변환합니다.
    /// - Parameters:
    ///   - formatType: DateFormatType으로 직접 format을 지정할 수 있음
    /// - Returns: Format에 맞는 String형 반환
    func convertToString(formatType: DateFormatType = .yearMonth) -> String {
        return formatType.formatter.string(from: self)
    }
}
