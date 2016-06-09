//
//  secondView.swift
//  SamsaoTest
//
//  Created by Benjamin Taubenblatt on 6/9/16.
//  Copyright © 2016 Samsao. All rights reserved.
//

import Foundation
import UIKit
import SteviaLayout

class secondView: UIView {
    
    // MARK: - Properties
    
    let name = UILabel()
    let sit = UILabel()
    let Photo = UILabel()
    private weak var vc: secondViewController?
    
    // MARK: - Initialization
    
    convenience init(viewController: secondViewController) {
        self.init(frame: CGRect.zero)
        vc = viewController
        viewMe(name, signature: sit)
}
    func viewMe(name: UILabel, signature: UILabel) {
        
        backgroundColor = UIColor.blueColor()
        //sv(
        // username.removeFromSuperview(),
        //password.removeFromSuperview()
        // )
        layout(
            100,
            |name ~ 80,
            8,
            |signature ~ 80,
            "",
            0
        )
        
        
    }

    
}