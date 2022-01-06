//
//  SecondVC.swift
//  Sample
//
//  Created by 정은희 on 2022/01/05.
//

import UIKit

class SecondVC: UIViewController {

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - @IBAction Properties
    @IBAction func transitionToThridVCDidTap(_ sender: Any) {
        let thridVC = ThirdVC.instanceFromNib()
        self.present(thridVC, animated: true)
    }
}
