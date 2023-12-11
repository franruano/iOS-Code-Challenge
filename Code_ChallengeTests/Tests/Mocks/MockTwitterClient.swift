@testable import Code_Challenge
import Foundation
import ReactiveKit


final class MockTwitterClient: TwitterClientType {
    private let bag = DisposeBag()
    
    init()
    {
        isLoggedIn = Property(isLoggedInResponse)
        _ = isLoggedIn.observeNext { _ in }
            .dispose(in: bag)
    }
    var isLoggedIn: Property<Bool>
    var isLoggedInResponse = false {
        didSet {
            isLoggedIn.value = isLoggedInResponse
        }
    }
    
    var logInCalled = 0
    var username: String?
    var password: String?
    func logIn(username: String, password: String) {
        logInCalled += 1
        self.username = username
        self.password = password
    }
    
    var logOutCalled = 0
    func logOut() {
        logOutCalled += 1
    }
    
    func loadTimeline() -> [Code_Challenge.Tweet] {
        return []
    }
}
