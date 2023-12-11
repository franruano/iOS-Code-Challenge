@testable import Code_Challenge
import XCTest

final class LoginViewControllerTests: XCTestCase {
    func testLoginButtonTapped() throws {
        let interactor = MockLoginInteractor()
        let sut = LoginViewController()
        sut.setup(interactor)
        sut.loadViewIfNeeded()
        sut.usernameTextField.text = "username"
        sut.passwordTextField.text = "password"

        sut.loginButtonTapped()
        
        XCTAssertEqual(interactor.loginCalled, 1)
        XCTAssertEqual(interactor.username, "username")
        XCTAssertEqual(interactor.password, "password")
    }
}
