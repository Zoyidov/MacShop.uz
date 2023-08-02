//
//  ViewController.swift
//  SignInWithApple
//
//  Created by Nurmuxammad Zoyidov on 02/08/23.
//

import AuthenticationServices
import UIKit

class ViewController: UIViewController {

    private let signInButton = ASAuthorizationAppleIDButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(signInButton)
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        signInButton.center = view.center
    }

}

