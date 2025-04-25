actor PopGestureManager {
    static let shared = PopGestureManager()
    private init() { }
    
    @MainActor
    private(set) var isEnabledPopGesture: Bool = true
    
    @MainActor
    func updatePopGestureState(isEnabled: Bool) {
        isEnabledPopGesture = isEnabled
    }
}
