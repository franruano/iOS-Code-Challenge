import Foundation

protocol LoginInteractorProtocol: AnyObject {
    func login(username: String, password: String)
}

final class LoginInteractor: LoginInteractorProtocol {
    internal let presenter: LoginPresenterProtocol
    internal let service: TwitterClientType
    
    init(_ presenter: LoginPresenterProtocol, service: TwitterClientType) {
        self.presenter = presenter
        self.service = service
    }
    
    func login(username: String, password: String) {
        service.logIn(username: username, password: password)
    }
}
