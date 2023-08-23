//
//  HomePageViewController.swift
//  PostDigitalPulse
//
//  Created by Nadeen Dames on 22/08/2023.
//

import UIKit

class HomePageViewController: DefualtsViewController {
    @IBOutlet weak var lblLatestPosts: UILabel!
    @IBOutlet weak var tvPosts: UITableView!
    @IBOutlet weak var imgRefresh: UIImageView!
    var postsViewModel = PostViewModel()
    let cellMargin: CGFloat = 10.0
    let cellContentHeight: CGFloat = 150.0
    override func viewDidLoad() {
        super.viewDidLoad()
        tvPosts.delegate = self
        tvPosts.dataSource = self
        tvPosts.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        loadInitialPosts()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(refreshScreen(_:)))
        self.imgRefresh.isUserInteractionEnabled = true
        self.imgRefresh.addGestureRecognizer(tapGesture)
        lblLatestPosts.text = "latestPosts".LC()
    }
    @objc func refreshScreen(_ gesture: UITapGestureRecognizer){
        postsViewModel.resetPagination()
        loadInitialPosts()
        scrollToTop()
    }
    
    private func scrollToTop() {
           if postsViewModel.numberOfPosts() > 0 {
               let indexPath = IndexPath(row: 0, section: 0)
               tvPosts.scrollToRow(at: indexPath, at: .top, animated: true)
           }
       }
    
    func loadInitialPosts(){
        postsViewModel.fetchPosts {[weak self] in
            self?.tvPosts.reloadData()
        }
    }
}

