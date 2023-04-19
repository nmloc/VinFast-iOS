//
//  HomeViewController.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 04/04/2023.
//

import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {
    // MARK: - Properties
    private let circleAvatar = CircleAvatar(imageUrl: user.avatarURL)
    private let viewModel = HomeViewModel()
    private var scrollView = UIScrollView()
    private var pageControl = UIPageControl()
    private var advertisementImages = [UIImage]()
    private let advertisementView = CarouselView()
    
    // MARK: - IBOulet components
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var adsView: UIView!
   
    // MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) { // Override this func to resize Avatar radius based on any device layout
        super.viewDidAppear(animated)
        if circleAvatar.frame.height > circleAvatar.frame.width {
            circleAvatar.layer.cornerRadius = circleAvatar.frame.width / 2.0
        } else {
            circleAvatar.layer.cornerRadius = circleAvatar.frame.height / 2.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupAdvertisementCarouselView()
        registerCategoryCollectionViewCell()
        registerProductCollectionViewCell()
    }
    
    // MARK: - Private Methods
    private func setupNavigationBar() {
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
        let heartImage = UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?.withTintColor(.label, renderingMode: .alwaysOriginal)

        let heartButton = UIBarButtonItem(image: heartImage, style: .plain, target: self, action: #selector(wishlistButtonTapped))

        let bellIcon = UIImage(systemName: "bell", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?.withTintColor(.label, renderingMode: .alwaysOriginal)
        let bellButton = UIBarButtonItem(image: bellIcon, style: .plain, target: self, action: #selector(notificationButtonTapped))

        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(customView: circleAvatar), UIBarButtonItem(customView: stackView)]
        navigationItem.rightBarButtonItems = [bellButton, heartButton]
        
        navigationController?.navigationBar.setItems([navigationItem], animated: true)
    }
    
    private func setupAdvertisementCarouselView() {
        let images: [UIImage] = ["advertisement-0", "advertisement-1"].compactMap { UIImage(named: $0) }
        advertisementView.setAdvertisementImages(images)
        adsView.addSubview(advertisementView)
        
        advertisementView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            advertisementView.leadingAnchor.constraint(equalTo: adsView.leadingAnchor),
            advertisementView.trailingAnchor.constraint(equalTo: adsView.trailingAnchor),
            advertisementView.topAnchor.constraint(equalTo: adsView.topAnchor),
            advertisementView.bottomAnchor.constraint(equalTo: adsView.bottomAnchor)
        ])
    }
    
    private func registerCategoryCollectionViewCell() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
    private func registerProductCollectionViewCell() {
        productCollectionView.register(UINib(nibName: ProductCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
    }
    
    // MARK: - Actions
    @objc private func notificationButtonTapped() {
        viewModel.notificationButtonTapped()
    }
    
    @objc private func wishlistButtonTapped() {
        viewModel.wishlistButtonTapped()
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case categoryCollectionView:
            // 4 is the number of items in 1 row
            let itemWidth = 56
            let freeSpaceInRow = collectionView.frame.width - CGFloat(3 * itemWidth)
            let inset = freeSpaceInRow / 5
            
            return CGFloat(inset)
        case productCollectionView:
            return 100
        default:
            return 10
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case productCollectionView:
            // 2 is the number of items in 1 row
            let itemWidth = 148
            let freeSpaceInRow = collectionView.frame.width - CGFloat(2 * itemWidth)
            let inset = freeSpaceInRow / 1.5
            
            return CGFloat(inset)
        default:
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case productCollectionView:
            return products.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell
            cell!.setup(item: categories[indexPath.row])
            return cell!
        case productCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell
            cell!.setup(item: products[indexPath.row])
            return cell!
        default:
            return UICollectionViewCell()
        }
    }
}
