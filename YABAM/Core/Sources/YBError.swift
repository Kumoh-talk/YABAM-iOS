import Foundation

public enum YBError: Error {
    case dependencyInjectionFailure
    case network
    case timeout
    case decoding
    case server(statusCode: Int)
    case api(code: String?, message: String?)
    case unknown
}

extension YBError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .dependencyInjectionFailure:
            return "의존성 주입 실패"
        case .network:
            return "네트워크 오류"
        case .timeout:
            return "요청 시간 초과"
        case .decoding:
            return "데이터 처리 오류"
        case .server:
            return "서버 오류"
        case .api:
            return "요청 실패"
        case .unknown:
            return "알 수 없는 오류"
        }
    }

    public var recoverySuggestion: String? {
        switch self {
        case .dependencyInjectionFailure:
            return "의존성 주입에 실패했습니다. 잠시 후 다시 시도해주세요."
        case .network:
            return "인터넷 연결 상태를 확인한 후 다시 시도해주세요."
        case .timeout:
            return "요청이 지연되었습니다. 잠시 후 다시 시도해주세요."
        case .decoding:
            return "데이터를 불러오는 데 실패했습니다. 잠시 후 다시 시도해주세요."
        case .server(let code):
            return "서버에서 문제가 발생했습니다. (HTTP \(code))"
        case .api(_, let message):
            return message ?? "요청을 처리할 수 없습니다. 다시 시도해주세요."
        case .unknown:
            return "예상치 못한 오류가 발생했습니다. 앱을 재시작해주세요."
        }
    }
}
