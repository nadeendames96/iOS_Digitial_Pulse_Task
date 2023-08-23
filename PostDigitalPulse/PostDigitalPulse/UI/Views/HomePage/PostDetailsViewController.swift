//
//  PostDetailsViewController.swift
//  PostDigitalPulse
//
//  Created by Nadeen Dames on 22/08/2023.
//

import UIKit

class PostDetailsViewController: UIViewController {
    @IBOutlet weak var lblPostComments: UILabel!
    @IBOutlet weak var lblPostID: UILabel!
    @IBOutlet weak var lblPostContent: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblAuthorInfo: UILabel!
    var postTitle = ""
    var postBody = ""
    var userID = 0
    var postID = 0
    @IBOutlet weak var lblCompanyAuthor: UILabel!
    @IBOutlet weak var lblWebSiteAuthor: UILabel!
    @IBOutlet weak var tvComments: UITableView!
    @IBOutlet weak var lblPhoneAuthor: UILabel!
    @IBOutlet weak var lblCityAuthor: UILabel!
    @IBOutlet weak var lblEmailAuthor: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblPostBody: UILabel!
    @IBOutlet weak var lblPostTitle: UILabel!
    var postsViewModel = PostViewModel()
    var comentsFiltered = CommentsModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tvComments.dataSource = self
        self.tvComments.delegate = self
        lblPostID.text = "ID# \(self.postID)"
        lblPostTitle.text = postTitle
        lblPostBody.text = postBody
        getDataAuthor()
        fetchPostComments()
        lblPostContent.text = "postContent".LC()
        lblAuthorInfo.text = "authorInfo".LC()
        lblPostComments.text = "postComments".LC()
    }
    
    @IBAction func backScreen(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func fetchPostComments(){
        postsViewModel.fetchCommentsPost {[weak self] in
            self?.comentsFiltered = self?.postsViewModel.comments.filter{$0.postID == self?.postID} ?? []
            self?.tvComments.reloadData()
        }
    }
    
    func getDataAuthor(){
        postsViewModel.fetchAllUsers {[weak self] in
            print("Fetched....")
            self?.postsViewModel.users.forEach{userInfo in
                if self?.userID == userInfo.id{
                    self?.lblAuthor.text = "name  \(userInfo.name ?? "")".LC()
                    self?.lblEmailAuthor.text = "email \(userInfo.email ?? "")".LC()
                    self?.lblCityAuthor.text = "city  \(userInfo.address.city ?? "")".LC()
                    self?.lblPhoneAuthor.text = "phone  \(userInfo.phone ?? "")".LC()
                    self?.lblWebSiteAuthor.text = "website  \(userInfo.website ?? "")".LC()
                    self?.lblCompanyAuthor.text = "company  \(userInfo.company.name ?? "")".LC()
                }
            }
        }
    }
}
