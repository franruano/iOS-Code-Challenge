@testable import Code_Challenge
import UIKit

final class MockTweetListViewController: TweetListView {
    func setup(_ interactor: TweetListInteractorProtocol) { }
    
    var loadTimelineCalled = 0
    func loadTimeline(_ tweets: [Tweet]) {
        loadTimelineCalled += 1
    }
}
