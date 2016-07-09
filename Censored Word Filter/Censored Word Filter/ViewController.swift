//
//  ViewController.swift
//  Censored Word Filter
//
//  Created by Andy Wong on 7/8/16.
//  Copyright © 2016 Andy Wong. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireNetworkActivityIndicator


class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var userInputTextField: UITextField!
    
    @IBOutlet weak var userOutputTextView: UITextView!
    
    
    
    var parameter = ["content": "Hello Fuck"]
    let header = ["X-Mashape-Key": "FjNvux1QkHmshi1BJXIR7Zz3clnKp1SebTfjsnSgsju7Ebd3Jn"]
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        parameter = ["content": userInputTextField.text!]
        
        let apiToConnect = "https://neutrinoapi-bad-word-filter.p.mashape.com/bad-word-filter"
        
        Alamofire.request(.GET, apiToConnect, parameters: parameter, headers: header ).responseJSON{ response in
            let responseJSON = response.result.value
            print (responseJSON)
            self.userOutputTextView.text = String(responseJSON!["bad-word-filter"])
        }
        
        textField.resignFirstResponder()
        return true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.userInputTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

