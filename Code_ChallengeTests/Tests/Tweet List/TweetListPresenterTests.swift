@testable import Code_Challenge
import XCTest

final class TweetListPresenterTests: XCTestCase {
    
    func testLoadTimeline() throws {
        let view = MockTweetListViewController()
        let sut = TweetListPresenter(view)
        let tweet = Tweet(id: 0, content: "content", user: "user")
        sut.loadTimeline([tweet, tweet])
        
        XCTAssertEqual(view.loadTimelineCalled, 1)
    }
}
