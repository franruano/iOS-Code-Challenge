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
    
//    func testNavigationControllerStack_WhenIsLoggedOut_AndLogIn() throws {
//        XCTAssertTrue(sut.navigationController.viewControllers.first? .isKind(of: LoginViewController.self) ?? false)
//        
//        mockTwitterClient.isLoggedInResponse = true
//        XCTAssertEqual(sut.navigationController.viewControllers.count, 1)
//        XCTAssertTrue(sut.navigationController.viewControllers.first? .isKind(of: TweetListViewController.self) ?? false)
//    }
//    
//    func testNavigationControllerStack_WhenIsLoggedIn_AndLogOut() throws {
//        mockTwitterClient.isLoggedInResponse = true
//        XCTAssertTrue(sut.navigationController.viewControllers.first? .isKind(of: TweetListViewController.self) ?? false)
//        mockTwitterClient.isLoggedInResponse = false
//        XCTAssertEqual(sut.navigationController.viewControllers.count, 1)
//        XCTAssertTrue(sut.navigationController.viewControllers.first? .isKind(of: LoginViewController.self) ?? false)
//    }
}
