//
//  HomeViewController.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 04/04/2023.
//

import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {
    // MARK: - Properties
    private let viewModel = HomeViewModel()
    private var scrollView = UIScrollView()
    private var pageControl = UIPageControl()
    private var advertisementImages = [UIImage]()
    private let advertisementView = CarouselView()
    
    // MARK: - IBOulet components
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var adsView: UIView!
    @IBOutlet weak var wishlistBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var notificationBarButtonItem: UIBarButtonItem!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.backgroundColor = background
        
        setupNavigationBar()
//        searchBar.showsScopeBar = true
//        searchBar.scopeButtonTitles = ["Filter"]
        setupAdvertisementCarouselView()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.register(UINib(nibName: ProductCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductDetail" {
            let destinationVC = segue.destination as! ProductDetailViewController
            destinationVC.product = sender as? ProductModel
        }
    }
    
    // MARK: - Private Methods
    private func setupNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false

        let fullNameLabel = UILabel()
        fullNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        fullNameLabel.textColor = .white
        fullNameLabel.text = user.name
        fullNameLabel.numberOfLines = 1

        let idLabel = UILabel()
        idLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        idLabel.textColor = .white
        idLabel.text = "@" + user.id
        idLabel.numberOfLines = 1

        let stackView = UIStackView(arrangedSubviews: [fullNameLabel, idLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: UIImageView().circular(imageURL: user.avatarURL!, size: 40.0)), UIBarButtonItem(customView: stackView)]
        navigationController?.navigationBar.setItems([navigationItem], animated: true)
        
        wishlistBarButtonItem.image = UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        notificationBarButtonItem.image = UIImage(systemName: "bell", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
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
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
            case categoryCollectionView:
                let itemWidth = 56
                let freeSpaceInRow = collectionView.frame.width - CGFloat(3 * itemWidth)
                let inset = freeSpaceInRow / 5
                
                return CGFloat(inset) // horizontal spacing
            case productCollectionView:
                return 50 //vertical spacing
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ProductCollectionViewCell {
            performSegue(withIdentifier: "showProductDetail", sender: products[cell.tag])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case categoryCollectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell
                cell!.setup(item: categories[indexPath.row])
                cell!.tag = indexPath.item
                return cell!
            case productCollectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell
                cell!.setup(item: products[indexPath.row])
                cell!.tag = indexPath.item
                return cell!
            default:
                return UICollectionViewCell()
        }
    }
}
