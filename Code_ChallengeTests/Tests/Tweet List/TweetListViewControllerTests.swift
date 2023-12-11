@testable import Code_Challenge
import XCTest

final class TweetListViewControllerTests: XCTestCase {
    var mockInteractor: MockTweetListInteractor!
    var sut: TweetListViewController!
    
    override func setUpWithError() throws {
        mockInteractor = MockTweetListInteractor()
        sut = TweetListViewController()
        
        sut.setup(mockInteractor)
    }

    override func tearDownWithError() throws {
        mockInteractor = nil
        sut = nil
    }

    func testLogOutButtonTapped() throws {
        sut.logOutButtonTapped()
        
        XCTAssertEqual(mockInteractor.logOutCalled, 1)
    }
    
    func testLoadTimeline() throws {
        let tweet = Tweet(id: 0, content: "content", user: "user")
        sut.loadTimeline([tweet, tweet, tweet])
        
        XCTAssertEqual(sut.tweets.count, 3)
    }
}
