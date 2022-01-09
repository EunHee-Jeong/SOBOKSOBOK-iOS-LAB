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
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    private func showAlert(_ message: String, completion: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "로그인",
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: completion)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - @IBAction Properties
    @IBAction func signUpButtonDidTapped(_ sender: Any) {
        let signUpVC = SignUpViewController.instanceFromNib()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @IBAction func signInButtonDidTapped(_ sender: Any) {
        requestLogin()
    }
}

// MARK: - Extensions
extension SignInViewController {
    func requestLogin() {
        UserSignInService.shared.signIn(email: emailTextField.text ?? "",
                                        password: passwordTextField.text ?? "") { responseData in
            switch responseData {
            case .success(let signInResponse):
                guard let response = signInResponse as? SignInResponseData else {return}
                self.showAlert(response.message) { _ in
                    let confirmVC = WelcomeViewController.instanceFromNib()
                    UserDefaults.standard.set(self.nameTextField.text, forKey: "message")
                    self.present(confirmVC, animated: true)
                }
            case .requestErr(let msg):
                print("requestErr \(msg)")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
