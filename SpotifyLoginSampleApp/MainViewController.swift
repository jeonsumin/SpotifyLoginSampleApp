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
    }
    
    //MARK: - IBAction
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
