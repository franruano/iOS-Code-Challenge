import Foundation

protocol LoginPresenterProtocol: AnyObject { }

final class LoginPresenter: LoginPresenterProtocol {
    private weak var view: LoginView?
    
    init(_ view: LoginView) {
        self.view = view
    }
}
