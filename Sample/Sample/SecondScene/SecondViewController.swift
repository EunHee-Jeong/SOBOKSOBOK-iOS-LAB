//
//  SecondViewController.swift
//  Sample
//
//  Created by taehy.k on 2022/01/05.
//

import UIKit

final class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func transitionToThirdViewControllerDidTap(_ sender: Any) {
        let thirdViewController = ThirdViewController.instanceFromNib()
        self.present(thirdViewController, animated: true)
    }
}
