import UIKit

protocol LoginView: AnyObject {
    func setup(_ interactor: LoginInteractorProtocol)
}

final class LoginViewController: UIViewController, LoginView {
    internal var interactor: LoginInteractorProtocol?
    
// MARK: - UI Components
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameTextField, passwordTextField, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setup(_ interactor: LoginInteractorProtocol) {
        self.interactor = interactor
    }
    
    // MARK: - Actions
    
    @objc func loginButtonTapped() {
        guard let username = usernameTextField.text?.lowercased(), let password = passwordTextField.text else { return }
        interactor?.login(username: username, password: password)
    }
}

private extension LoginViewController {
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
