//
//  VCPresenter.swift
//  MVP  Design Patterns
//
//  Created by IwasakIYuta on 2021/09/14.
//　　 viewとmodelの仲介役　デリゲートでやりとりをする ここにたくさんロジックを書く予定

import Foundation

protocol VCDelegate: AnyObject {
    func showMessage(message: String)
    func userSuccessFullyLoggedin()
}


class VCPresenter {
   
    weak var delegate: VCDelegate?
    var user: User!
    
    var name: String {

        return user.name
    }
    var email: String {

        return user.email
    }
    var gender: String {

        return user.gendertype
    }
    
    
    func validate(name: String, password: String, email: String, gendertype: String?) {
        
        print("kokonikiterru")
        guard name.count != 0,
              password.count > 6,
              email.count > 6,
              email.range(of: "@") != nil,
              gendertype != nil else {
            print("test validate")
            delegate?.showMessage(message: "ログインに失敗しました")
            return
        }
        let gender = Gender(rawValue: "male")
        
        user = User(name: name, email: email, password: password, gender: gender!, gendertype: gendertype!)
        delegate?.userSuccessFullyLoggedin()

    
    }


}
