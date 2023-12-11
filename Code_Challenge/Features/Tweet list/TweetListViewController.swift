import UIKit

protocol TweetListView: UIViewController {
    func setup(_ interactor: TweetListInteractorProtocol)
    func loadTimeline(_ tweets: [Tweet])
}

final class TweetListViewController: UIViewController, TweetListView {
    private var interactor: TweetListInteractorProtocol?
    private var tweets = [Tweet]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: SubtitleTableViewCell.cellName)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavigationBar()
        
        interactor?.loadTimeline()
    }
    
    func setup(_ interactor: TweetListInteractorProtocol) {
        self.interactor = interactor
    }
    
    func loadTimeline(_ tweets: [Tweet]) {
        self.tweets = tweets
    }
    
    @objc func logOutButtonTapped() {
        interactor?.logOut()
    }
}

extension TweetListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SubtitleTableViewCell.cellName, for: indexPath)

        let tweet = tweets[indexPath.row]
        cell.textLabel?.text = tweet.content
        cell.detailTextLabel?.text = tweet.user
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

private extension TweetListViewController {
    func setupNavigationBar() {
        let logOutButton = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logOutButtonTapped))
        navigationItem.rightBarButtonItem = logOutButton
    }
    
    func setupUI() {
        view.backgroundColor = .white

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
