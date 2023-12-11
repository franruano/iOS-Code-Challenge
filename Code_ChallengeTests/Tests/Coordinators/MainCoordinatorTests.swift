@testable import Code_Challenge
import XCTest

final class MainCoordinatorTests: XCTestCase {

    var mockTwitterClient: MockTwitterClient!
    var sut: MainCoordinator!
    
    override func setUpWithError() throws {
        mockTwitterClient = MockTwitterClient()
        sut = MainCoordinator(service: mockTwitterClient)
    }

    override func tearDownWithError() throws {
        mockTwitterClient = nil
        sut = nil
    }

    func testNavigationControllerStack_WhenIsLoggedOut() throws {
        XCTAssertEqual(sut.navigationController.viewControllers.count, 1)
        XCTAssertTrue(sut.navigationController.viewControllers.first? .isKind(of: LoginViewController.self) ?? false)
    }
    
    func testNavigationControllerStack_WhenIsLoggedOut_AndLogIn() throws {
        let expectation = XCTestExpectation(description: "wait for login")
        XCTAssertTrue(sut.navigationController.viewControllers.first? .isKind(of: LoginViewController.self) ?? false)
        
        mockTwitterClient.isLoggedInResponse = true
//        Not the right solution. Just for testing purposes
//        It should use NSProtocol
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(sut.navigationController.viewControllers.count, 1)
        XCTAssertTrue(sut.navigationController.viewControllers.first? .isKind(of: TweetListViewController.self) ?? false)
    }
}
