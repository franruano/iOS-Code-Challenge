import Foundation

protocol TweetListInteractorProtocol: AnyObject {
    func logOut()
    func loadTimeline()
}

final class TweetListInteractor: TweetListInteractorProtocol {
    let presenter: TweetListPresenterProtocol
    let service: TwitterClientType
    
    init(_ presenter: TweetListPresenterProtocol, service: TwitterClientType) {
        self.presenter = presenter
        self.service = service
    }
    
    func logOut() {
        service.logOut()
    }
    
    func loadTimeline() {
        let tweets = service.loadTimeline()
        presenter.loadTimeline(tweets)
    }
}
