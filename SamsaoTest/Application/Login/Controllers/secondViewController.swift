//
//  secondViewController.swift
//  SamsaoTest
//
//  Created by Benjamin Taubenblatt on 6/9/16.
//  Copyright © 2016 Samsao. All rights reserved.
//

import Foundation
import UIKit


class secondViewController: UIViewController {
    var name = ""
    var sit = ""
    var pw = ""
    var photo = ""
    var imageView = UIImageView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let label1 = UILabel(frame: CGRectMake(0, 0, 200, 21)) //Name: Alice
        label1.center = CGPointMake(195, 250)
        label1.textAlignment = NSTextAlignment.Center
        label1.text = "Name: \(name)"
        self.view.addSubview(label1)
        
        let label2 = UILabel(frame: CGRectMake(0, 0, 200, 21)) //I have many secrets
        label2.center = CGPointMake(250, 290)
        label2.textAlignment = NSTextAlignment.Center
        label2.text = "\(sit)"
        self.view.addSubview(label2)
        
        let label3 = UILabel(frame: CGRectMake(0, 0, 200, 21)) //Signature:
        label3.center = CGPointMake(130, 290)
        label3.textAlignment = NSTextAlignment.Center
        label3.text = "Signature: "
        self.view.addSubview(label3)
        
        let label4 = UILabel(frame: CGRectMake(0, 0, 200, 21)) //Password: YWxpY2U=
        label4.center = CGPointMake(195, 270)
        label4.textAlignment = NSTextAlignment.Center
        label4.text = "Password: \(pw)"
        self.view.addSubview(label4)
        
        if let checkedUrl = NSURL(string: "\(photo)") {
            imageView.contentMode = .ScaleAspectFit
            downloadImage(checkedUrl)
        }
        
        //display image
        imageView.frame = CGRect(x: 125, y: 0, width: 160, height: 260)
        view.addSubview(imageView)
        
        self.view.backgroundColor = UIColor.grayColor()
    }
    
    
    //get the data from your url
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
    
    //download the image
    func downloadImage(url: NSURL){
        print("Download Started")
        print("lastPathComponent: " + (url.lastPathComponent ?? ""))
        getDataFromUrl(url) { (data, response, error)  in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                print(response?.suggestedFilename ?? "")
                print("Download Finished")
                self.imageView.image = UIImage(data: data)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
}