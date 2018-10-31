//
//  SampleTwoViewController.swift
//  TableViewOperations
//
//  Created by mahendra on 10/10/18.
//  Copyright © 2018 mahindra. All rights reserved.
//

import UIKit

class SampleTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        NotificationCenter.default.addObserver(self, selector: #selector(SampleTwoViewController.actOnSpecialNotification), name: NSNotification.Name(rawValue: notificationKey), object: nil)
    }
    
    override func awakeFromNib() {
        NotificationCenter.default.addObserver(self, selector: #selector(SampleTwoViewController.actOnSpecialNotification), name: NSNotification.Name(rawValue: notificationKey), object: nil)
    }
    
    @IBOutlet weak var notifiText: UILabel!
    
    @objc func actOnSpecialNotification(){
        self.notifiText.text = "Got the notification!"
    }
    
    @IBAction func removeNotification(_ sender: Any) {
        
        NotificationCenter.default.removeObserver(self)

        
        self.notifiText.text = "I am Waiting!"
    }
    
    

}
