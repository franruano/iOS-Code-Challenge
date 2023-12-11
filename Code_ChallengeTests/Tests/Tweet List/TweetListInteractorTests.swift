@testable import Code_Challenge
import XCTest

final class TweetListInteractorTests: XCTestCase {
    var presenter: MockTweetListPresenter!
    var service: MockTwitterClient!
    var sut: TweetListInteractor!
    
    override func setUpWithError() throws {
        presenter = MockTweetListPresenter()
        service = MockTwitterClient()
        sut = TweetListInteractor(presenter, service: service)
    }

    override func tearDownWithError() throws {
        presenter = nil
        service = nil
        sut = nil
    }

    func testLogOut() throws {
        sut.logOut()
        XCTAssertEqual(service.logOutCalled, 1)
    }
    
    func testLoadTimeLine() {
        sut.loadTimeline()
        XCTAssertEqual(presenter.loadTimelineCalled, 1)
    }
}
