import Foundation

protocol LoginPresenterProtocol: AnyObject { }

final class LoginPresenter: LoginPresenterProtocol {
    internal weak var view: LoginView?
    
    init(_ view: LoginView) {
        self.view = view
    }
}
