import UIKit

final class MainCoordinator {
    
    private let service: TwitterClient
    
    init(service: TwitterClient) {
        self.service = service
    }
    
    func loadApp() -> UIViewController {
        UINavigationController(rootViewController: Login.build(service))
    }
}
