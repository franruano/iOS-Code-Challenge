import Foundation

final class TweetListBuilder {
    static func build(_ service: TwitterClientType) -> TweetListView {
        let view = TweetListViewController()
        let presenter = TweetListPresenter(view)
        let interactor = TweetListInteractor(presenter, service: service)
        view.setup(interactor)
        return view
    }
}
