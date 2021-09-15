//
//  ViewController.swift
//  MVP  Design Patterns
//
//  Created by IwasakIYuta on 2021/09/11.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
    let presenter =  VCPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControlsetup()
        messageLabel.isHidden = true
        
        presenter.delegate = self
    
    
    }
    private func segmentedControlsetup() {
        genderSegmentedControl.setTitle("設定しない", forSegmentAt: 0)
        genderSegmentedControl.setTitle(Gender.other.rawValue, forSegmentAt: 1)
        genderSegmentedControl.setTitle(Gender.female.rawValue, forSegmentAt: 2)
        genderSegmentedControl.setTitle(Gender.male.rawValue, forSegmentAt: 3)
        
    }
    
    
    //MARK-submitDate
    @IBAction func submitDateButton(_ sender: Any) {
        
        guard let name = nameTextField.text,
              let password = passwordTextField.text,
              let email = emailTextField.text,
              let gender = genderSegmentedControl.titleForSegment(at: genderSegmentedControl.selectedSegmentIndex) else {
            print("testtest")
            return
        }
       print("testlogin success")
        presenter.validate(name: name, password: password, email: email, gendertype: gender)
    }
    


}

//MRAK: -extension
extension ViewController: VCDelegate {
    
    func showMessage(message: String) {
        messageLabel.isHidden = false
        messageLabel.text = message
        
    }
    
    
    func userSuccessFullyLoggedin() {
       
        messageLabel.isHidden = false
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0
        messageLabel.text = "ログイン成功しましたー"
   
    print("name:\(presenter.name)\nemail:\(presenter.email)")
    
    }
    
    
    
}
