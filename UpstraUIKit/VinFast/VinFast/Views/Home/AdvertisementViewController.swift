//
//  AdvertisementTabView.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 05/04/2023.
//

import UIKit

class CarouselView: UIView, UIScrollViewDelegate {
    
    private var scrollView = UIScrollView()
    private var pageControl = UIPageControl()
    private var advertisementImages = [UIImage]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        // Set up the scroll view
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        addSubview(scrollView)
        
        // Set up the page control
        pageControl.numberOfPages = advertisementImages.count
        addSubview(pageControl)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.frame = bounds
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(advertisementImages.count), height: scrollView.frame.height)
        
        for i in 0..<advertisementImages.count {
            let imageView = UIImageView(image: advertisementImages[i])
            imageView.frame = CGRect(x: scrollView.frame.width * CGFloat(i), y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
        }
        
        pageControl.sizeToFit()
        pageControl.center = CGPoint(x: bounds.midX, y: bounds.maxY - pageControl.frame.height)
    }
    
    func setAdvertisementImages(_ images: [UIImage]) {
        advertisementImages = images
        pageControl.numberOfPages = advertisementImages.count
        setNeedsLayout()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
}
