//
//  PostDetailsViewControllerEX.swift
//  PostDigitalPulse
//
//  Created by Nadeen Dames on 23/08/2023.
//

import UIKit
import KRProgressHUD
extension PostDetailsViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("CoomentsCounr",self.postsViewModel.numberOfCommentsPost())
        return self.comentsFiltered.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvComments.dequeueReusableCell(withIdentifier: "CommentsTableViewCell",for: indexPath) as! CommentsTableViewCell
            cell.lblName.text = comentsFiltered[indexPath.row].name ?? ""
            cell.lblEmail.text = comentsFiltered[indexPath.row].email ?? ""
            cell.lblComment.text = comentsFiltered[indexPath.row].body ?? ""
        return cell
    }
}
