//
//  EnterEmailViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by Terry on 2022/01/10.
//

import UIKit

class EnterEmailViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var errorMessageLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    //MARK: - LiceCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.white]
        nextButton.layer.cornerRadius = 30
        nextButton.isEnabled = false
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        // 첫번째 커서를 이메일텍스트필드에 포커싱
        emailTextField.becomeFirstResponder()
    }
    
    //MARK: - IBAction
    @IBAction func nextButtonTapped(_ sender: Any) {
    }
    
}

//MARK: - UITextFieldDelegate
extension EnterEmailViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmail = emailTextField.text == ""
        let isPassword = passwordTextField.text == ""
        nextButton.isEnabled = !isEmail && !isPassword
    }
}
