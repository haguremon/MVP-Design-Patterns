//
//  VCPresenter.swift
//  MVP  Design Patterns
//
//  Created by IwasakIYuta on 2021/09/14.
//　　 viewとmodelの仲介役　デリゲートパターンでやりとりをする

import Foundation

protocol VCDelegate: AnyObject {
    func showMessage(message: String)
    func userSuccessFullyLoggedin()
}


final class VCPresenter: NSObject {
   
    weak var delegate: VCDelegate?
    
}
