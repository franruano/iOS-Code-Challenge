@testable import Code_Challenge
import XCTest

final class TweetListBuilderTests: XCTestCase {

    func testBuilder() throws {
        let mockService = MockTwitterClient()
        let sut = TweetListBuilder.build(mockService)
        let view = try XCTUnwrap(sut as? TweetListViewController)
        let interactor = try XCTUnwrap(view.interactor as? TweetListInteractor)
        let presenter = try XCTUnwrap(interactor.presenter as? TweetListPresenter)
        let service = try XCTUnwrap(interactor.service as? MockTwitterClient)
        
        XCTAssertTrue(presenter.view === view)
    }
}
