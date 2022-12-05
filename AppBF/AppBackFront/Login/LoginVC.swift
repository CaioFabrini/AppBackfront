//
//  ViewController.swift
//  AppBackFront
//
//  Created by Caio Fabrini on 15/09/22.
//

import UIKit
import Firebase
import FirebaseAuth

enum AlertString: String {
    case alert = "Atenção"
    case errorMassage = "Dados incorretos, verifique seus dados"
    case userMassage = "Tivemos um problema inesperado, tente novamente mais tarde"
}

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
        self.configButtonEnable(false)
    }
    
    public func validaTextField() {
        if (self.loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) &&  (self.loginScreen?.loginTextField.text ?? "").isValid(validType: .email) {
            configButtonEnable(true)
        } else {
            configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enanle: Bool) {
        if enanle {
            self.loginScreen?.loginButton.setTitleColor(.white, for: .normal)
            self.loginScreen?.loginButton.isEnabled = true
        }else{
            self.loginScreen?.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginScreen?.loginButton.isEnabled = false
        }
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(self.loginScreen?.loginTextField) {
            self.loginScreen?.passwordTextField.becomeFirstResponder()
        }else {
            self.loginScreen?.passwordTextField.resignFirstResponder()
        }
        return textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
            
        } else {
            switch textField {
            case self.loginScreen?.loginTextField:
                
                if (self.loginScreen?.loginTextField.text ?? "").isValid(validType: .email) {
                    self.loginScreen?.loginTextField.layer.borderWidth = 0
                } else {
                    self.loginScreen?.loginTextField.layer.borderWidth = 1.5
                    self.loginScreen?.loginTextField.layer.borderColor = UIColor.red.cgColor
                }
            case self.loginScreen?.passwordTextField:
                
                if (self.loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
                    self.loginScreen?.passwordTextField.layer.borderWidth = 0
                } else {
                    self.loginScreen?.passwordTextField.layer.borderWidth = 1.5
                    self.loginScreen?.passwordTextField.layer.borderColor = UIColor.red.cgColor
                }
            default:
                break
            }
        }
        self.validaTextField()
    }
}

extension LoginVC: LoginScreenProtocol {
    func actionLoginButton() {
        
        let vc: HomeVC = HomeVC()
        
        guard let login = self.loginScreen else { return }
        
        self.auth?.signIn(withEmail: login.getLogin(), password: login.getPassword(), completion: { user, error in
            if error != nil {
                self.alert?.getAlert(title: AlertString.alert.rawValue , message: AlertString.errorMassage.rawValue)
            }else{
                if user == nil{
                    self.alert?.getAlert(title: AlertString.alert.rawValue, message: AlertString.userMassage.rawValue)
                }else{
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        })
    }
}



