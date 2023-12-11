import UIKit

final class MainCoordinator {
    
    private let service: TwitterClient
    
    init(service: TwitterClient) {
        self.service = service
    }
    
    func loadApp() -> UIViewController {
//        UINavigationController(rootViewController: LoginBuilder.build(service))
        
        UINavigationController(rootViewController: TweetListBuilder.build(service))
    }
}
