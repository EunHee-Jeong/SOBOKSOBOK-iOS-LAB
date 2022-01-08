//
//  SignUpViewController.swift
//  EunHee
//
//  Created by 정은희 on 2022/01/08.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - @IBOutlet Properties
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - @IBAction Properties
    @IBAction func nextButtonDidTapped(_ sender: Any) {
        let confirmVC = WelcomeViewController.instanceFromNib()
        self.present(confirmVC, animated: true)
    }
    
}
