import UIKit

protocol LoginView: UIViewController {
    func setup(_ interactor: LoginInteractorProtocol)
}

final class LoginViewController: UIViewController, LoginView {

    private weak var interactor: LoginInteractorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }
    
    func setup(_ interactor: LoginInteractorProtocol) {
        self.interactor = interactor
    }
}
