//
//  SSOLoginView.swift
//  SamsaoTest
//
//  Created by NIE Shanhe on 2016-03-30.
//  Copyright © 2016 Samsao. All rights reserved.
//

import UIKit
import SteviaLayout

class SSOLoginView: UIView {

    // MARK: - Properties

    let username = UITextField()
    let password = UITextField()
    let login = UIButton()
    private weak var vc: SSOLoginViewController?

    // MARK: - Initialization

    convenience init(viewController: SSOLoginViewController) {
        self.init(frame: CGRect.zero)
        vc = viewController
        render()
    }

    // MARK: - UI

    func render() {
        backgroundColor = UIColor.whiteColor()

        sv(
            username.placeholder("Username").style(fieldStyle),
            password.placeholder("Password").style(fieldStyle).style(passwordFieldStyle),
            login.text("LOGIN").style(buttonStyle).tap(loginTapped)
        )

        layout(
            100,
            |-username-| ~ 80,
            8,
            |-password-| ~ 80,
            "",
            |login| ~ 80,
            0
        )

        username.delegate = vc
        password.delegate = vc
    }

    func fieldStyle(field: UITextField) {
        field.borderStyle = .RoundedRect
        field.font = UIFont(name: "HelveticaNeue-Light", size: 26)
        field.autocapitalizationType = .None
        field.autocorrectionType = .No
        field.returnKeyType = .Next
    }

    func passwordFieldStyle(field: UITextField) {
        field.secureTextEntry = true
        field.returnKeyType = .Done
    }

    func buttonStyle(button: UIButton) {
        button.backgroundColor = .lightGrayColor()
    }

    func loginTapped() {
        // TODO: Implement it.
    }
}
