@testable import Code_Challenge
import XCTest

final class LoginInteractorTests: XCTestCase {
    func testLogin() throws {
        let presenter = MockLoginPresenter()
        let service = MockTwitterClient()
        let sut = LoginInteractor(presenter, service: service)

        sut.login(username: "username", password: "password")

        XCTAssertEqual(service.logInCalled, 1)
        XCTAssertEqual(service.username, "username")
        XCTAssertEqual(service.password, "password")
    }
}
