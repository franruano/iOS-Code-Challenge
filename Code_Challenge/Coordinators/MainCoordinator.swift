import UIKit

final class MainCoordinator {
    private let service: TwitterClientType
    let navigationController = UINavigationController()
    
    init(service: TwitterClientType) {
        self.service = service
        _ = service.isLoggedIn.observeNext { [weak self] isLoggedIn in
            if isLoggedIn {
                self?.showTweets()
            } else {
                self?.displayLogin()
            }
        }
    }
    
    private func displayLogin() {
        guard let viewController = LoginBuilder.build(service) as? UIViewController else { return }
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    private func showTweets() {
        guard let viewController = TweetListBuilder.build(service) as? UIViewController else { return }
        navigationController.setViewControllers([viewController], animated: true)
    }
}
