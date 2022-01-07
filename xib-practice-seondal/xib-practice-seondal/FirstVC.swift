//
//  FirstVC.swift
//  xib-practice-seondal
//
//  Created by 김선오 on 2022/01/06.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var MoveToSecondVC: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func MoveToSecondVC(_ sender: Any) {
        let secondVC = SecondVC.instanceFromNib()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
}
