@testable import Code_Challenge
import Foundation

final class MockTweetListInteractor: TweetListInteractorProtocol {
    var logOutCalled = 0
    var loadTimelineCalled = 0
    
    func loadTimeline() {
        loadTimelineCalled += 1
    }
    
    func logOut() {
        logOutCalled += 1
    }
}
