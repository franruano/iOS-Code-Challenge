import Foundation

final class LoginBuilder {
    static func build(_ service: TwitterClient) -> LoginView {
        let view = LoginViewController()
        let presenter = LoginPresenter(view)
        let interactor = LoginInteractor(presenter, service: service)
        let viewController = LoginViewController()
        viewController.setup(interactor)
        return view
    }
}
