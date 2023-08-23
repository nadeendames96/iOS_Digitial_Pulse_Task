//
//  DefualtsViewController.swift
//  PostDigitalPulse
//
//  Created by Nadeen Dames on 22/08/2023.
//

import UIKit

class DefualtsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func presentAlertWithPop(withTitle title: String, message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: {_ in
            self.dismiss(animated: true)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
