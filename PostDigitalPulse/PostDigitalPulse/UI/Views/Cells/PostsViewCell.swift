//
//  PostsViewCell.swift
//  PostDigitalPulse
//
//  Created by Nadeen Dames on 22/08/2023.
//

import UIKit

class PostsViewCell: UITableViewCell {
 
    @IBOutlet weak var tvPostBody: UILabel!
    @IBOutlet weak var lblPostTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDataCreated: UILabel!
    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemBlue.cgColor
    }

        
}
