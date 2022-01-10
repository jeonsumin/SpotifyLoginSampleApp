//
//  MainViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by Terry on 2022/01/10.
//

import UIKit
import FirebaseAuth


class MainViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet var welcomLabel: UILabel!
    @IBOutlet var resetPasswordButton: UIButton!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        let email = Auth.auth().currentUser?.email ?? "고객"
        welcomLabel.text = """
            환영합니다.
            \(email)님
            """
        
        let isEmailSignIn = Auth.auth().currentUser?.providerData[0].providerID == "password"
        resetPasswordButton.isHidden = !isEmailSignIn
    }
    
    //MARK: - IBAction
    @IBAction func resetPasswordButtonTapped(_ sender: UIButton) {
        let email = Auth.auth().currentUser?.email ?? ""
        Auth.auth().sendPasswordReset(withEmail: email, completion: nil)
        
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popToRootViewController(animated: true)
        }catch let signOutError as NSError {
            print("ERROR: signout \(signOutError.localizedDescription)")
        }

    }
    
}
