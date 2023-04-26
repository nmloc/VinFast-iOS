//
//  ReviewsViewController.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 22/04/2023.
//

import UIKit

class ReviewsViewController: UIViewController {
    // MARK: - Properties
    var product: ProductModel?
    
    // MARK: - IBOutlets
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var reviewsCollectionView: UICollectionView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = background
        
        setupSegmentedControl()
        
        reviewsCollectionView.delegate = self
        reviewsCollectionView.dataSource = self
        reviewsCollectionView.register(UINib(nibName: ReviewCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ReviewCollectionViewCell.identifier)
    }
    
    // MARK: - Private Methods
    private func setupSegmentedControl() {
        segmentedControl.backgroundColor = background
        segmentedControl.tintColor = .white
        // Remove the vertical divider line between segments
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
}

extension ReviewsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40 //vertical spacing
    }
}

extension ReviewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product!.reviews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCollectionViewCell.identifier, for: indexPath) as? ReviewCollectionViewCell
        cell!.setup(item: product!.reviews[indexPath.row])
        cell!.tag = indexPath.item
        return cell!
    }
}
