//
//  ProductDetailViewController.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 22/04/2023.
//

import UIKit

class ProductDetailViewController: UIViewController, UIScrollViewDelegate {
    // MARK: - Properties
    var product: ProductModel?
    var selectedColorCell: ColorFilterCollectionViewCell?
    
    // MARK: - IBOulets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var wishlistBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var colorFilterCollectionView: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var detailImagesCollectionView: UICollectionView!
    @IBOutlet weak var priceLabel: UILabel!
    
    // MARK: - IBActions
    @IBAction func didTapWishlistBarButtonItem(_ sender: Any) {
        
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.backgroundColor = background
        
        wishlistBarButtonItem.image = UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        
        if let product = self.product {
            imageView.image = UIImage(named: product.colors[0].image) // initialize with image related to the first color in ColorFilterCollectionView
            imageView.layer.cornerRadius = 10
            nameLabel.text = product.name
            descriptionLabel.text = product.description
            priceLabel.text = "\(product.price)"
            reviewButton.setTitle(Int(product.numOfReviews)!.grammaticalReview(rate: Double(product.rate)!), for: .normal)
            emptyButtonTitle()
            
            colorFilterCollectionView.delegate = self
            colorFilterCollectionView.dataSource = self
            colorFilterCollectionView.register(UINib(nibName: ColorFilterCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ColorFilterCollectionViewCell.identifier)
            
            detailImagesCollectionView.delegate = self
            detailImagesCollectionView.dataSource = self
            detailImagesCollectionView.register(UINib(nibName: ProductDetailImagesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductDetailImagesCollectionViewCell.identifier)
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReview" {
            let destinationVC = segue.destination as! ReviewsViewController
            destinationVC.product = product
        }
    }
    
    // MARK: - Private Methods
    
    
    //  MARK: - UIButton remove title
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    
    private func emptyButtonTitle() {
        messageButton.setTitle("", for: .normal)
        callButton.setTitle("", for: .normal)
    }
}

// MARK: UICollectionViewDelegate
extension ProductDetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ColorFilterCollectionViewCell {
            selectedColorCell!.checkmarkImageView.isHidden = true
            cell.checkmarkImageView.isHidden = false
            selectedColorCell = cell
            
            let relativeImage = product!.colors[cell.tag].image
            imageView.image = UIImage(named: relativeImage)?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let colorCell = cell as? ColorFilterCollectionViewCell else {
            return
        }
        if indexPath.row == 0 {
            // This is the first cell
            colorCell.checkmarkImageView.isHidden = false
            selectedColorCell = colorCell
        } else {
            // This is not the first cell
        }
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension ProductDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == colorFilterCollectionView {
            let unscrollableWidth = UIScreen.main.bounds.width - 10*2
            let cellWidth = 40 // adjust as needed
            let totalCellWidth = cellWidth * product!.colors.count
            let totalSpacingWidth = 12 * (product!.colors.count - 1) // adjust as needed
            let usedWidth = totalCellWidth + totalSpacingWidth

            if CGFloat(usedWidth) < unscrollableWidth {
                let collectionViewWidth = collectionView.frame.width
                let inset = (CGFloat(collectionViewWidth) - CGFloat(usedWidth)) / 2.0

                return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: 0)
            }

            return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        } else {
            return UIEdgeInsets.zero
        }
    }
}

// MARK: UICollectionViewDataSource
extension ProductDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            case colorFilterCollectionView:
                return product!.colors.count
            case detailImagesCollectionView:
                return product!.detailImages.count
            default:
                return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case colorFilterCollectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorFilterCollectionViewCell.identifier, for: indexPath) as? ColorFilterCollectionViewCell
                cell!.setup(color: product!.colors[indexPath.row].color)
                cell!.tag = indexPath.item
                return cell!
            case detailImagesCollectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailImagesCollectionViewCell.identifier, for: indexPath) as? ProductDetailImagesCollectionViewCell
                cell!.setup(image: product!.detailImages[indexPath.row])
                cell!.tag = indexPath.item
                return cell!
            default:
                return UICollectionViewCell()
        }
    }
}
