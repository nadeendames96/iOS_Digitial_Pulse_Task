//
//  HomePageViewControllerEx.swift
//  PostDigitalPulse
//  Created by Nadeen Dames on 22/08/2023.
//

import Foundation
import UIKit
import KRProgressHUD
extension HomePageViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postsViewModel.numberOfPosts() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvPosts.dequeueReusableCell(withIdentifier: "PostsViewCell",for: indexPath) as! PostsViewCell
        let post = postsViewModel.post(at: indexPath.row)
        cell.lblPostTitle.text = "Title : \(post.title)"
        cell.tvPostBody.text = post.body
        if indexPath.row == postsViewModel.numberOfPosts() - 1 {
            postsViewModel.fetchPosts { [weak self] in
                self?.tvPosts.reloadData()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard =  UIStoryboard(name: StoryBoards.Home.rawValue, bundle: nil)
    let postDetails = storyboard.instantiateViewController(withIdentifier: "PostDetailsViewController") as! PostDetailsViewController
        let post = postsViewModel.post(at: indexPath.row)
        postDetails.postTitle = postsViewModel.posts[indexPath.row].title ?? ""
        postDetails.postBody = postsViewModel.posts[indexPath.row].body ?? ""
        postDetails.userID = postsViewModel.posts[indexPath.row].userID ?? 0
        postDetails.postID = postsViewModel.posts[indexPath.row].id ?? 0
        navigationController?.pushViewController(postDetails, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           // Calculate total cell height including margin
           return cellContentHeight + 2 * cellMargin
       }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
           let offsetY = scrollView.contentOffset.y
           let contentHeight = scrollView.contentSize.height
           let tableViewHeight = scrollView.frame.height
           if offsetY > contentHeight - tableViewHeight {
               postsViewModel.loadNextBatch()
               tvPosts.reloadData()
           }
       }
}
