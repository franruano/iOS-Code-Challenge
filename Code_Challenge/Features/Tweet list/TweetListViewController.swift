import UIKit

protocol TweetListView: UIViewController {
    func setup(_ interactor: TweetListInteractorProtocol)
}

final class TweetListViewController: UIViewController, TweetListView {
    
    private var interactor: TweetListInteractorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNavigationBar()
    }
    
    func setup(_ interactor: TweetListInteractorProtocol) {
        self.interactor = interactor
    }
    
    @objc func logOutButtonTapped() {
        // Add your authentication logic here
        print("LogOut button tapped")
    }
}

private extension TweetListViewController {
    func setupNavigationBar() {
        // Create a "Sign Up" button
        let signUpButton = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logOutButtonTapped))
        
        // Add the button to the navigation bar
        navigationItem.rightBarButtonItem = signUpButton
    }
}
