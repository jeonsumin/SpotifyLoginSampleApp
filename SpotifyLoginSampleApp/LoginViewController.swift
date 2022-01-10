//
//  LoginViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by Terry on 2022/01/10.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet var emailLoginButton: UIButton!
    @IBOutlet var googleLoginButton: UIButton!
    @IBOutlet var appleLoginButton: UIButton!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        [emailLoginButton,googleLoginButton,appleLoginButton].forEach {
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.borderWidth = 1
            $0?.layer.cornerRadius = 30
        }
    }
    
    //MARK: - IBAction
    @IBAction func emailLoginButtonTapped(_ sender: Any) {
        //Firebase 인증
    }
    @IBAction func googleLoginButtonTapped(_ sender: Any) {
        //Firebase 인증
    }
    @IBAction func appleLoginButtonTapped(_ sender: Any) {
        //Firebase 인증
    }
}
