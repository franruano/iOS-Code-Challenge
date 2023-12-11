import Foundation

protocol LoginInteractorProtocol: AnyObject {
    func login(usernarme: String, password: String)
}

final class LoginInteractor: LoginInteractorProtocol {
    private let presenter: LoginPresenterProtocol
    private let service: TwitterClient
    
    init(_ presenter: LoginPresenterProtocol, service: TwitterClient) {
        self.presenter = presenter
        self.service = service
    }
    
    func login(usernarme: String, password: String) {
        service.logIn(username: usernarme, password: password)
    }
}
