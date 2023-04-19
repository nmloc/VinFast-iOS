//
//  ChatViewController.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 18/04/2023.
//

import AmityUIKit
import UIKit

class ChatViewController: UIViewController {
    // MARK: Properties
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    private let mySegmentedControl = UISegmentedControl(items: ["Global Feed", "My Feed", "Explore"])
    private var pages: [UIViewController] = []
    private let underlineView = UIView()
    
    // MARK: IB Outlets
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentedControl()
        view.addSubview(pageViewController.view)
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        setupPageViewController()
    }
    // MARK: setup Segmented Control
    private func setupSegmentedControl() {
        segmentedControl.setTitle("Recent", forSegmentAt: 0)
//        segmentedControl.setTitle("Directory", forSegmentAt: 1)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        // Remove the vertical divider line between segments
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        // Set the background color of unselected segments to system background color
        segmentedControl.setBackgroundImage(imageWithColor(color: UIColor.systemBackground), for: .normal, barMetrics: UIBarMetrics.default)

        // Helper function to create image with solid color
        func imageWithColor(color: UIColor) -> UIImage {
            let rect = CGRect(x: 0, y: 0, width: 100, height: 48)
            UIGraphicsBeginImageContext(rect.size)
            let context = UIGraphicsGetCurrentContext()
            context?.setFillColor(color.cgColor)
            context?.fill(rect)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image ?? UIImage()
        }
        
        let normalTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
            NSAttributedString.Key.foregroundColor: UIColor.systemGray2,
        ]

        let selectedTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
            NSAttributedString.Key.foregroundColor: UIColor.systemBlue,
            NSAttributedString.Key.strikethroughStyle: [],
        ] as [NSAttributedString.Key : Any]

        segmentedControl.setTitleTextAttributes(normalTextAttributes, for: .normal)
        segmentedControl.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        
        customUnderline()
    }
    
    private func customUnderline() {
        underlineView.backgroundColor = UIColor.systemBlue
        segmentedControl.addSubview(underlineView)
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.bottomAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: -2).isActive = true
        underlineView.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1/CGFloat(segmentedControl.numberOfSegments)).isActive = true
        underlineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        underlineView.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor, constant: CGFloat(segmentedControl.selectedSegmentIndex) * segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)).isActive = true
        underlineView.topAnchor.constraint(equalTo: segmentedControl.subviews[segmentedControl.selectedSegmentIndex].lastBaselineAnchor, constant: 12).isActive = true
    }
    
    // Function to update the position of the underline view
    func updateUnderlineViewPosition() {
        // constraints need to be updated
        let segmentWidth = segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)
        underlineView.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor, constant: CGFloat(segmentedControl.selectedSegmentIndex) * segmentWidth).isActive = true
        underlineView.widthAnchor.constraint(equalToConstant: segmentWidth).isActive = true
        
        // keep same
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.bottomAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: -2).isActive = true
        underlineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        underlineView.topAnchor.constraint(equalTo: segmentedControl.subviews[segmentedControl.selectedSegmentIndex].lastBaselineAnchor, constant: 12).isActive = true
    }
    // MARK: setup Page View
    private func setupPageViewController() {
//        pageViewController.dataSource = self
//        pageViewController.delegate = self
        
        let initialPage = 0
        
        // add the individual viewControllers to the pageViewController
        let recentChat = AmityRecentChatViewController.make(channelType: .community)
        recentChat.removeSwipeBackGesture()
        
        pages.append(recentChat)
        pages.append(RefreshableChatViewController())
        pageViewController.setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
        
        // segmentedControl
        segmentedControl.selectedSegmentIndex = initialPage
        segmentedControl.addTarget(self, action: #selector(segmentedValueChanged(_:)), for: .valueChanged)
    }
    // MARK: - Actions
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!) {
        underlineView.removeFromSuperview()
        segmentedControl.subviews[sender.selectedSegmentIndex].addSubview(underlineView)
        updateUnderlineViewPosition()
        
        pageViewController.setViewControllers([pages[segmentedControl.selectedSegmentIndex]], direction: .forward, animated: false, completion: nil)
    }
}

extension ChatViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
            if viewControllerIndex == 0 {
                // wrap to last page in array
                return self.pages.last
            } else {
                // go to previous page in array
                return self.pages[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
            if viewControllerIndex < self.pages.count - 1 {
                // go to next page in array
                return self.pages[viewControllerIndex + 1]
            } else {
                // wrap to first page in array
                return self.pages.first
            }
        }
        return nil
    }
    
}

extension ChatViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        // set the pageControl.currentPage to the index of the current viewController in pages
        if let viewController = pageViewController.viewControllers?.first,
           let viewControllerIndex = pages.firstIndex(of: viewController) {
            segmentedControl.selectedSegmentIndex = viewControllerIndex
        }
    }
    
}


class RefreshableChatViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.backgroundColor = .systemTeal
        setupScrollView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        refreshControl.endRefreshing()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.frame
    }
    
    private func setupScrollView() {
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        scrollView.refreshControl = refreshControl
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
    }
    
    @objc private func reloadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }
}
