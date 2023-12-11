import UIKit

final class MainCoordinator {
    
    private let service: TwitterClient
    let navigationController = UINavigationController()
    
    init(service: TwitterClient) {
        self.service = service
        _ = service.isLoggedIn.observeNext { [weak self] isLoggedIn in
            if isLoggedIn {
                self?.showTweets()
            } else {
                self?.displayLogin()
            }
        }
    }
    
    func displayLogin() {
        navigationController.setViewControllers([LoginBuilder.build(service)], animated: true)
    }
    
    func showTweets() {
        navigationController.setViewControllers([TweetListBuilder.build(service)], animated: true)
    }
}
