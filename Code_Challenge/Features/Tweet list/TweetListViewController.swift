import UIKit

protocol TweetListView: UIViewController {
    func setup(_ interactor: TweetListInteractorProtocol)
}

final class TweetListViewController: UIViewController, TweetListView {

    private weak var interactor: TweetListInteractorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
    }
    
    func setup(_ interactor: TweetListInteractorProtocol) {
        self.interactor = interactor
    }
}
