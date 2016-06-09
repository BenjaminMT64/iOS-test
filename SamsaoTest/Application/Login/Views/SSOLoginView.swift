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
    
    
    func buttonClicked(sender:UIButton){
        do{
        login.backgroundColor = UIColor.blueColor()
        //declare parameter as a dictionary which contains string as key and value combination.
        let parameters = ["username": username.text!, "password": password.text!] as Dictionary<String, String>
        
        //create the url with NSURL
        let url = NSURL(string: "http://api.samsaodev.com/login/") //change the url
        
        //now create the NSMutableRequest object using the url object
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST" //set http method as POST
        
        //let err: NSError?
        request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(parameters, options: []) // pass dictionary to nsdata object and set it as request body
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        var response: NSURLResponse?
            do {
                let dataVal = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response) as NSData?
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(dataVal!, options:[]) as? NSDictionary {
                    print("\(jsonResult)")
                }
                }
                // look at the response
                if let httpResponse = response as? NSHTTPURLResponse {
                    print("HTTP response: \(httpResponse.statusCode)")
                    print("data \(httpResponse.allHeaderFields)")
                    print("full Response: \(response)")
                } else {
                    print("No HTTP response")
                }
            } catch (let e) {
                print(e)
            }
        
    }
    
    
    
    func loginTapped() {
        // TODO: Implement it.
        
        login.addTarget(self, action: #selector(SSOLoginView.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
    }




}


