//
//  FirstVC.swift
//  xib-practice-seondal
//
//  Created by 김선오 on 2022/01/06.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func MoveToSecondVC(_ sender: Any) {
        
//        let navigationController = UINavigationController(rootViewController: self)
        
        let secondVC = SecondVC.instanceFromNib()
//        navigationController.pushViewController(secondVC, animated: true)
        present(secondVC, animated: true, completion: nil)
    }
    
}
