@testable import Code_Challenge
import Foundation

final class MockLoginPresenter: LoginPresenterProtocol {
    var presentLoginCalled = 0
    
    func presentLogin() {
        presentLoginCalled += 1
    }
}
