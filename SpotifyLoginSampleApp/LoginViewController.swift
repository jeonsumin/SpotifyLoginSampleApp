//
//  LoginViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by Terry on 2022/01/10.
//

import UIKit
import GoogleSignIn
import Firebase

class LoginViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet var emailLoginButton: UIButton!
    @IBOutlet var googleLoginButton: GIDSignInButton!
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
    @IBAction func googleLoginButtonTapped(_ sender: Any) {
        //Firebase 인증
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self ] user , error  in
            if let error = error {
                print("ERROR Google Sign In \(error.localizedDescription)")
            }
            guard let auth = user?.authentication else { return }
            let credental = GoogleAuthProvider.credential(withIDToken: auth.idToken!, accessToken: auth.accessToken)
                  
            Auth.auth().signIn(with: credental) { _, _ in
                showMainViewController()
            }
        }
        
    }
    @IBAction func appleLoginButtonTapped(_ sender: Any) {
        //Firebase 인증
    }
    
    //MARK: - Function
    private func showMainViewController(){
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = sb.instantiateViewController(withIdentifier: "MainViewController")
        mainViewController.modalPresentationStyle = .fullScreen
        navigationController?.show(mainViewController, sender: nil)
    }
}
