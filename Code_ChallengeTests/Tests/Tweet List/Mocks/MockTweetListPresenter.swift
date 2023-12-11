@testable import Code_Challenge
import Foundation

final class MockTweetListPresenter: TweetListPresenterProtocol {
    var loadTimelineCalled = 0
    
    func loadTimeline(_ tweets: [Tweet]) {
        loadTimelineCalled += 1
    }
}
