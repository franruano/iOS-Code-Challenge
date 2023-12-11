import Foundation

final class TweetListBuilder {
    static func build(_ service: TwitterClient) -> TweetListView {
        let view = TweetListViewController()
        let presenter = TweetListPresenter(view)
        let interactor = TweetListInteractor(presenter, service: service)
        let viewController = TweetListViewController()
        viewController.setup(interactor)
        return view
    }
}
