import UIKit

protocol TweetListView: UIViewController {
    func setup(_ interactor: TweetListInteractorProtocol)
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tweetCell")
        view.addSubview(tableView)
        tableView.dataSource = self
        // tableView.delegate = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavigationBar()
    }
    
    func setup(_ interactor: TweetListInteractorProtocol) {
        self.interactor = interactor
    }
    
    @objc func logOutButtonTapped() {
        interactor?.logOut()
    }
}

extension TweetListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath)
        
        let tweet = tweets[indexPath.row]
        cell.textLabel?.text = tweet.content
        cell.detailTextLabel?.text = tweet.user
        
        return cell
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
