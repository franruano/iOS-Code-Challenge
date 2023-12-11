import Foundation

protocol LoginPresenterProtocol: AnyObject { }

final class LoginPresenter: LoginPresenterProtocol {
    private let view: LoginView
    
    init(_ view: LoginView) {
        self.view = view
    }
}
