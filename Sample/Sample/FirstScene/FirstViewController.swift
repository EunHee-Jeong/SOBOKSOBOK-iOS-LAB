//
//  FirstViewController.swift
//  Sample
//
//  Created by taehy.k on 2022/01/05.
//

import UIKit

final class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func transitionToSecondViewControllerDidTap(_ sender: Any) {
        let secondViewController = SecondViewController.instanceFromNib()
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}
