@testable import Code_Challenge
import Foundation

final class MockLoginInteractor: LoginInteractorProtocol {
    var loginCalled = 0
    var username: String?
    var password: String?
    
    func login(username: String, password: String) {
        loginCalled += 1
        self.username = username
        self.password = password
    }
}
