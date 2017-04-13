//
//  ViewController.swift
//  Censored Word Filter
//
//  Created by Andy Wong on 7/8/16.
//  Copyright © 2016 Andy Wong. All rights reserved.
//

import UIKit
//import SwiftyJSON
import Alamofire
import AlamofireNetworkActivityIndicator


class ViewController: UIViewController, UITextFieldDelegate{ //Uses UITextFieldDelegate to allow userInputTextField be a delegate to use fuction textFieldShouldReturn so keboard 'return' button being tapped will allow the keyboard to drop down and put the API request. 

    @IBOutlet weak var userInputTextField: UITextField!
    
    @IBOutlet weak var userOutputTextView: UITextView!
    
    
    
    var parameter = ["content": "Hello"] //Parameter that will be placed into the API to see if there are any bad words
    let header = ["X-Mashape-Key": "FjNvux1QkHmshi1BJXIR7Zz3clnKp1SebTfjsnSgsju7Ebd3Jn"] //Contains API Key
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore. // When return key is presssed, code below will be performed.
    {
        parameter = ["content": userInputTextField.text!] // User Input for the parameter that will be user to check for 'Bad Words'
        
        let apiToConnect = "https://neutrinoapi-bad-word-filter.p.mashape.com/bad-word-filter" //API Access URL
        
        Alamofire.request(.GET, apiToConnect, parameters: parameter, headers: header ).responseJSON{ response in //Using Alamofire, it will use a GET request to grab information from the API with the URL, the the parameter that the user inputs, then enter the API key (header), we use responseJSON to get a response and called a closure with name response.
            let responseJSON = response.result.value //Creates a constant responseJSON that will hold the response's result value.
            print (responseJSON)//pritns constant responseJSOn to use console to grab result of responseJSON
            self.userOutputTextView.text = String(responseJSON!["bad-words-list"]) //Prints the result of responseJSON to userOutputTextView.
            print (responseJSON)
        }
        
        textField.resignFirstResponder() //When return is pressed on keyboard, the keyboard will be removed on it's own
        return true; //Does the function if it is true. if placed False, it will ignore the done button being tapped
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

