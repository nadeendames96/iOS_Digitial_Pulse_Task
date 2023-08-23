//
//  HomeTabBar.swift
//  SHOFNE APP
//
//  Created by Eng Yoka on 18/07/2023.
//

import UIKit
class HomeTabBar: UITabBarController {
    public  let coustmeTabBarView:UIView = {
         //  daclare coustmeTabBarView as view
         let view = UIView(frame: .zero)
         // to make the cornerRadius of coustmeTabBarView
         view.backgroundColor = .white
         view.layer.cornerRadius = 20
         view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
         view.clipsToBounds = true
         // to make the shadow of coustmeTabBarView
         view.layer.masksToBounds = false
         view.layer.shadowColor = UIColor.gray.cgColor
         view.layer.shadowOffset = CGSize(width: 1, height: 1)
         view.layer.shadowOpacity = 0.5
         view.layer.shadowRadius = 10.0
         return view
     }()
    override func viewDidLoad() {
        super.viewDidLoad()
       
          tabBar.layer.cornerRadius = 5
          addcoustmeTabBarView()
          hideTabBarBorder()
//     UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name:"Cairo-SemiBold", size: 14)!], for: .normal)
        setText()
    }
    

    
  
    private func addcoustmeTabBarView() {
        //
       coustmeTabBarView.frame = tabBar.frame
        view.addSubview(coustmeTabBarView)
        view.bringSubviewToFront(self.tabBar)
    }
    
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = 49
        tabFrame.origin.y = self.view.frame.size.height - 49
          coustmeTabBarView.frame = tabFrame
        
      }
    
    func hideTabBarBorder()  {
        let tabBar = self.tabBar
        tabBar.backgroundImage = UIImage.from(color: .clear)
        tabBar.shadowImage = UIImage()
        tabBar.clipsToBounds = true

    }
  

    @objc func setText() {
          tabBar.items?[0].title = "Home"
      }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}

extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
