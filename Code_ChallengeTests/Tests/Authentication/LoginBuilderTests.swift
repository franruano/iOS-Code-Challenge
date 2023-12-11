@testable import Code_Challenge
import XCTest

final class LoginBuilderTests: XCTestCase {
    
    func testBuilder() throws {
        let mockService = MockTwitterClient()
        let sut = LoginBuilder.build(mockService)
        let view = try XCTUnwrap(sut as? LoginViewController)
        let interactor = try XCTUnwrap(view.interactor as? LoginInteractor)
        let presenter = try XCTUnwrap(interactor.presenter as? LoginPresenter)
        let service = try XCTUnwrap(interactor.service as? MockTwitterClient)
        
        XCTAssertTrue(presenter.view === view)
    }
}
