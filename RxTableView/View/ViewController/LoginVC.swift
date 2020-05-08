//
//  LoginVC.swift
//  RxTableView
//
//  Created by SonNV-D1 on 5/7/20.
//  Copyright © 2020 SonNV-D1. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginVC: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private let loginViewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.becomeFirstResponder()
        
        usernameTextField.rx.text
            .map({$0 ?? ""})
            .bind(to: loginViewModel.usernameTextPublishSubject)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text
            .map({$0 ?? ""})
            .bind(to: loginViewModel.passwordTextPublishSubject)
            .disposed(by: disposeBag)
        
        loginViewModel.isValid()
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        loginViewModel.isValid()
            .map({$0 ? 1 : 0.1})
            .bind(to: loginButton.rx.alpha)
            .disposed(by: disposeBag)
    }
        
    @IBAction func actionLogin(_ sender: Any) {
        print("kabakd")
    }
}
