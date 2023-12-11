import Foundation

protocol TweetListPresenterProtocol {
    
}

final class TweetListPresenter: TweetListPresenterProtocol {
    private let view: TweetListView
    
    init(_ view: TweetListView) {
        self.view = view
    }
}
