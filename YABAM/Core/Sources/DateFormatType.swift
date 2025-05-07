import Foundation

public enum DateFormatType {
    case yearMonth
    case yearMonthDay
    case yearMonthDayKorean
    case time12Hour
    case time12HourEnglish
    case time24Hour
    case monthDay
    case monthDayWithWeekday
    case weekday

    public var formatter: DateFormatter {
        let formatter = DateFormatter()

        switch self {
        case .yearMonth:
            formatter.dateFormat = "yyyy년 MM월"
            
        case .yearMonthDay:
            formatter.dateFormat = "yyyy-MM-dd"
            formatter.locale = Locale(identifier: "ko_KR")

        case .yearMonthDayKorean:
            formatter.dateFormat = "yyyy년 MM월 dd일"

        case .time12Hour:
            formatter.dateFormat = "a h시 m분"
            formatter.amSymbol = "오전"
            formatter.pmSymbol = "오후"
            formatter.locale = Locale(identifier: "ko_KR")

        case .time12HourEnglish:
            formatter.dateFormat = "a h:mm"
            formatter.amSymbol = "AM"
            formatter.pmSymbol = "PM"

        case .time24Hour:
            formatter.dateFormat = "HH:mm"

        case .monthDay:
            formatter.dateFormat = "M월 d일"

        case .monthDayWithWeekday:
            formatter.dateFormat = "M월 d일 (E)"

        case .weekday:
            formatter.dateFormat = "EEEE"
            formatter.locale = Locale(identifier: "en_US_POSIX")
        }

        return formatter
    }
}
