//
//  SignInViewController.swift
//  EunHee
//
//  Created by 정은희 on 2022/01/08.
//

import UIKit

class SignInViewController: UIViewController {
    
    // MARK: - @IBOutlet Properties
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - @IBAction Properties
    @IBAction func signUpButtonDidTapped(_ sender: Any) {
        let signUpVC = SignUpViewController.instanceFromNib()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @IBAction func signInButtonDidTapped(_ sender: Any) {
        let confirmVC = WelcomeViewController.instanceFromNib()
        self.present(confirmVC, animated: true)
    }
    
    
}
