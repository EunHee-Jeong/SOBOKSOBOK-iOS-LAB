//
//  FirstVC.swift
//  Sample
//
//  Created by 정은희 on 2022/01/05.
//

import UIKit

import EasyKit

class FirstVC: UIViewController {
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - @IBAction Properties
    @IBAction func transitionToSecondVCDidTap(_ sender: Any) {
        let secondVC = SecondVC.instanceFromNib()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
