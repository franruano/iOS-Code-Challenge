import Foundation

protocol TweetListPresenterProtocol: AnyObject { }

final class TweetListPresenter: TweetListPresenterProtocol {
    private weak var view: TweetListView?
    
    init(_ view: TweetListView) {
        self.view = view
    }
}
