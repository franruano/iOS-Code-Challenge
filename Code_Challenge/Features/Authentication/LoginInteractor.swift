import Foundation

protocol LoginInteractorProtocol: AnyObject {
    
}

final class LoginInteractor: LoginInteractorProtocol {
    private let presenter: LoginPresenterProtocol
    private let service: TwitterClient
    
    init(_ presenter: LoginPresenterProtocol, service: TwitterClient) {
        self.presenter = presenter
        self.service = service
    }
}
