import Foundation

protocol TweetListInteractorProtocol: AnyObject {
    
    func logOut()
}

final class TweetListInteractor: TweetListInteractorProtocol {
    private let presenter: TweetListPresenterProtocol
    private let service: TwitterClient
    
    init(_ presenter: TweetListPresenterProtocol, service: TwitterClient) {
        self.presenter = presenter
        self.service = service
    }
    
    func logOut() {
        service.logOut()
    }
}
