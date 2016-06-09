//
//  SSOLoginViewController.swift
//  SamsaoTest
//
//  Created by NIE Shanhe on 2016-03-30.
//  Copyright © 2016 Samsao. All rights reserved.
//

import UIKit

class SSOLoginViewController: UIViewController {

    // MARK: Properties

    private var realView: SSOLoginView {
        return view as! SSOLoginView
    }

    // MARK: Lifecycle

    override func loadView() {
        view = SSOLoginView(viewController: self)
    }
    
   }

extension SSOLoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField === realView.username) {
            realView.password.becomeFirstResponder()
        } else {
            realView.password.resignFirstResponder()
        }
        return true
    }
}