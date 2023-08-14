//
//  PopUPViewController.swift
//  TotalityApp
//
//  Created by Futuretek on 10/08/23.
//

import UIKit

class PopUPViewController: UIViewController {

    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view2.isHidden = true
        view3.isHidden = true
    }
    

    @IBAction func firstViewAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, animations: {
                    self.view1.frame = CGRect(x: -self.view.frame.size.width, y: self.view1.frame.origin.y, width: self.view1.frame.size.width, height: self.view1.frame.size.height)
                    self.view2.frame = CGRect(x: 0, y: self.view2.frame.origin.y, width: self.view2.frame.size.width, height: self.view2.frame.size.height)
                   self.view1.transform = CGAffineTransform(translationX: 0, y: self.view1.frame.height)
                   self.view1.transform = .identity
                }) { _ in
                    self.view1.isHidden = true
                    self.view3.isHidden = true
                    self.view2.isHidden = false
                    
                }
        
    }
    
    @IBAction func secondViewAction(_ sender: UIButton) {
        view2.isHidden = true
        UIView.animate(withDuration: 0.3, animations: {
                   self.view2.frame = CGRect(x: self.view.frame.size.width, y: self.view2.frame.origin.y, width: self.view2.frame.size.width, height: self.view2.frame.size.height)
                   self.view1.frame = CGRect(x: 0, y: self.view1.frame.origin.y, width: self.view1.frame.size.width, height: self.view1.frame.size.height)
                 self.view2.transform = CGAffineTransform(translationX: 0, y: self.view2.frame.height)
                 self.view2.transform = .identity
               }) { _ in
                   self.view2.isHidden = true
                   self.view3.isHidden = false
               }
       
    }
    
    @IBAction func thirdAction(_ sender: Any) {
        self.view3.transform = CGAffineTransform(translationX: 0, y: self.view3.frame.height)
        self.view3.transform = .identity
        
    }
    
}
