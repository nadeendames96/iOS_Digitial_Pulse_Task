//
//  CommentsTableViewCell.swift
//  PostDigitalPulse
//
//  Created by Nadeen Dames on 23/08/2023.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewContent.layer.cornerRadius = 10
    }



}
