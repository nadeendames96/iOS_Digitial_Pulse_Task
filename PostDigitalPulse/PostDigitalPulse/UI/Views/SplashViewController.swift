//
//  ViewController.swift
//  PostDigitalPulse
//
//  Created by Nadeen Dames on 22/08/2023.
//

import UIKit

class SplashViewController: DefualtsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
            self.perform(#selector(self.presentWithCustomAnimation), with: nil, afterDelay: 3)
    }
    @objc func presentWithCustomAnimation (){
//        KRProgressHUD.show()
            let storyboard =  UIStoryboard(name:"Home", bundle: nil)
            let userlogin = storyboard.instantiateViewController(withIdentifier: "HomeTabBar") as! HomeTabBar
//            KRProgressHUD.dismiss()
            self.navigationController?.pushViewController(userlogin, animated: true)
    }
}

