//
//  GlobalPostsFeedViewController.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//
import UIKit
import AmityUIKit

class GlobalPostsFeedViewController: UIViewController {
    // MARK: - Properties
    private var dataSource: GlobalPostsDataSource!
    private let circleAvatar = CircleAvatar(imageUrl: user.avatarURL)
    
    // MARK: - IBOulet components
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        dataSource = GlobalPostsDataSource(client: AmityUIKitManager.client)
        
        activityIndicator.startAnimating()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "PostPreviewTableViewCell", bundle: nil), forCellReuseIdentifier: "PostPreviewTableViewCell")

        dataSource.observePostsFeedChanges { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) { // Override this func to resize Avatar radius based on any device layout
        super.viewDidAppear(animated)
        if circleAvatar.frame.height > circleAvatar.frame.width {
            circleAvatar.layer.cornerRadius = circleAvatar.frame.width / 2.0
        } else {
            circleAvatar.layer.cornerRadius = circleAvatar.frame.height / 2.0
        }
    }
    
    // MARK: - Private Methods
    func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        // LEFT part
        let fullNameLabel = UILabel()
        fullNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        fullNameLabel.textColor = .label
        fullNameLabel.text = user.name
        fullNameLabel.numberOfLines = 1

        let idLabel = UILabel()
        idLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        idLabel.textColor = .label
        idLabel.text = "@" + user.id
        idLabel.numberOfLines = 1

        let stackView = UIStackView(arrangedSubviews: [fullNameLabel, idLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5

        // RIGHT part
        let heartImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?.withTintColor(.label, renderingMode: .alwaysOriginal)

        let heartButton = UIBarButtonItem(image: heartImage, style: .plain, target: self, action: #selector(chatButtonTapped))

        let bellIcon = UIImage(systemName: "bell", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?.withTintColor(.label, renderingMode: .alwaysOriginal)
        let bellButton = UIBarButtonItem(image: bellIcon, style: .plain, target: self, action: #selector(notificationButtonTapped))

        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(customView: circleAvatar), UIBarButtonItem(customView: stackView)]
        navigationItem.rightBarButtonItems = [bellButton, heartButton]
        
        navigationController?.navigationBar.setItems([navigationItem], animated: true)
    }

    // Support Pagination
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let frameHeight = scrollView.frame.size.height
        let contentOffset = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        let distanceFromBottom = contentHeight - contentOffset
        if distanceFromBottom < frameHeight {
            dataSource.loadMorePosts()
        }
    }
    
    // MARK: - Actions
    @objc private func notificationButtonTapped() {
//        viewModel.notificationButtonTapped()
    }
    
    @objc private func chatButtonTapped() {
//        viewModel.firstButtonBottomNavBarTapped()
    }
}

extension GlobalPostsFeedViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.getNumberOfFeedItems()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostPreviewTableViewCell") as! PostPreviewTableViewCell
        if let post = dataSource.getPostAtIndex(index: indexPath.section) {
            cell.display(post: post)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
