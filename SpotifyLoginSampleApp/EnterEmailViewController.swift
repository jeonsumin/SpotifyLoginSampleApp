//
//  EnterEmailViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by Terry on 2022/01/10.
//

import UIKit
import FirebaseAuth

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
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        // Firebase 이메일 / 비밀번호 인증
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        //신규 사용자 생성
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard let self = self else { return }
            
            if let error = error {
                let code = (error as NSError).code
                switch code{
                case 17007: //이미 가입한 계정일 때
                    //로그인 하기
                    self.loginUser(withEmail: email, password: password)
                default:
                    self.errorMessageLabel.text = error.localizedDescription
                }
            }else {
                self.showMainViewController()
            }
            
        }
    }
    
    //MARK: - Functoin
    private func showMainViewController(){
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = sb.instantiateViewController(withIdentifier: "MainViewController")
        mainViewController.modalPresentationStyle = .fullScreen
        navigationController?.show(mainViewController, sender: nil)
    }
    
    private func loginUser(withEmail eamil: String, password:String){
        Auth.auth().signIn(withEmail: eamil, password: password) { [weak self] _, error  in
            guard let self = self else { return }
            if let error = error {
                self.errorMessageLabel.text = error.localizedDescription
            }else {
                self.showMainViewController()
            }
        }
    }
}

//MARK: - UITextFieldDelegate
extension EnterEmailViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmail = emailTextField.text == ""
        let isPassword = passwordTextField.text == ""
        nextButton.isEnabled = !isEmail && !isPassword
    }
}
