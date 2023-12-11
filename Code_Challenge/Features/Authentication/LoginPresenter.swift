import Foundation

protocol LoginPresenterProtocol {
    
}

final class LoginPresenter: LoginPresenterProtocol {
    private let view: LoginView
    
    init(_ view: LoginView) {
        self.view = view
    }
}
