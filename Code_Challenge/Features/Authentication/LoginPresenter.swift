import Foundation

protocol LoginPresenterProtocol: AnyObject { }

final class LoginPresenter: LoginPresenterProtocol {
    private(set) weak var view: LoginView?
    
    init(_ view: LoginView) {
        self.view = view
    }
}
