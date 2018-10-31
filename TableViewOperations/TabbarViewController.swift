//
//  TabbarViewController.swift
//  TableViewOperations
//
//  Created by mahendra on 10/10/18.
//  Copyright © 2018 mahindra. All rights reserved.
//

import UIKit

let notificationKey = "com.mahindra.splnotificationkey"

class TabbarViewController: UIViewController, UITabBarDelegate {

    @IBOutlet weak var sampleTabBar: UITabBar!
//
//    var sampleOne : UIViewController?
//
    var sampleTwo : UIViewController?
    
    @IBOutlet weak var notificationText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        sampleTabBar.delegate = self
       
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    @objc func labelUpdate(){
        self.notificationText.text = "Notification sent!"
    }
    
    @IBAction func notify(_ sender: Any) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(TabbarViewController.labelUpdate), name: NSNotification.Name(rawValue: notificationKey), object: nil)
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationKey), object: self)
    }
    
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem){

        switch item.tag {

        case 1:

            if sampleTwo == nil {

                var storyboard = UIStoryboard(name: "Main", bundle: nil)

                sampleTwo = storyboard.instantiateViewController(withIdentifier: "s2") as! SampleTwoViewController
            }

            sampleTwo?.view.removeFromSuperview()

            break


        case 2:

            if sampleTwo == nil {

                var storyboard = UIStoryboard(name: "Main", bundle: nil)

                sampleTwo = storyboard.instantiateViewController(withIdentifier: "s2") as! SampleTwoViewController
            }
            self.view.insertSubview(sampleTwo!.view!, belowSubview: self.sampleTabBar)


            break

        default:

            break

        }

    }
    @IBAction func removeNotify(_ sender: Any) {
        
        self.notificationText.text = "Notification in construction!"
    }
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
