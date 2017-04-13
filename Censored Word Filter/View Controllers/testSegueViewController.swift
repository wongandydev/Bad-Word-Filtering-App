//
//  testSegueViewController.swift
//  Censored Word Filter
//
//  Created by Andy Wong on 7/10/16.
//  Copyright © 2016 Andy Wong. All rights reserved.
//

import UIKit
import Foundation


class testSegueViewController: UIViewController {
 
    @IBAction override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    }
    
    @IBOutlet weak var quoteTextView: UITextView!
    @IBAction func learnMoreButtonTapped(sender: AnyObject) {
        let url = NSURL(string: "https://nobullying.com/how-to-counter-the-devastating-effects-of-verbal-bullying") //Constant URL containts a string which is the URL that needs to be accessed
        UIApplication.sharedApplication().openURL(url!) // Opens the link from above in safari
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
