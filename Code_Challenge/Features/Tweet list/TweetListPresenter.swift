import Foundation

protocol TweetListPresenterProtocol: AnyObject { 
    func loadTimeline(_ tweets: [Tweet])
}

final class TweetListPresenter: TweetListPresenterProtocol {
    private weak var view: TweetListView?
    
    init(_ view: TweetListView) {
        self.view = view
    }
    
    func loadTimeline(_ tweets: [Tweet]) {
        view?.loadTimeline(tweets)
    }
}
