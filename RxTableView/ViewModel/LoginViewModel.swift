//
//  LoginViewModel.swift
//  RxTableView
//
//  Created by SonNV-D1 on 5/7/20.
//  Copyright © 2020 SonNV-D1. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewModel {
    let usernameTextPublishSubject = PublishSubject<String>()
    let passwordTextPublishSubject = PublishSubject<String>()
    
    func isValid() -> Observable<Bool> {
        Observable.combineLatest(usernameTextPublishSubject.asObserver().startWith(""), passwordTextPublishSubject.asObserver().startWith("")).map({username, password in
            return (username.count > 7 && password.count > 7)
        }).startWith(false)
    }
}
