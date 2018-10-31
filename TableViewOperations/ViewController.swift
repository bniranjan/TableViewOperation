//
//  ViewController.swift
//  TableViewOperations
//
//  Created by mahendra on 14/08/18.
//  Copyright © 2018 mahindra. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    let array : [String] = ["one","two","three","four","five"]
    
    var selected: [Int]! = []
    
    var latestArray : [Int]! = []

    @IBOutlet weak var sampleTableView: UITableView!
    
    // There is a change here!!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if UserDefaults.standard.array(forKey: "userSelected")  != nil{
            latestArray = UserDefaults.standard.array(forKey: "userSelected") as! [Int]
            print(array)
            print(latestArray)
        }
      
        if sampleTableView.isHidden == true{
            self.sampleTableView.isHidden = false
        }
    }
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.sampleTableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = array[indexPath.row] as! String
 
        if latestArray.contains(indexPath.row){
            print("Yes now checkmark")
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        else{
            print("No its not")
            cell?.accessoryType = UITableViewCellAccessoryType.none
        }
        
 
        return cell!
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = self.sampleTableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = self.sampleTableView.cellForRow(at: indexPath) {
            
            if cell.isSelected
            {
                cell.isSelected = false
                
                if cell.accessoryType == UITableViewCellAccessoryType.none
                {
                    cell.accessoryType = UITableViewCellAccessoryType.checkmark
                   
                    self.latestArray.append(indexPath.row)
                    
                    print("Selected are: \(self.latestArray)")
                }
                else
                {
                    cell.accessoryType = UITableViewCellAccessoryType.none
                    
                    let re = indexPath.row
                    
                    self.latestArray.remove(at: self.latestArray.index(of: re)!)
                    
                    print("Remaining is: \(self.latestArray)")
                    
//                    if self.selected != nil{
//
//
//                    }
                
                }
            }
            
            self.sampleTableView.reloadData()
            
        }
    }

    @IBAction func clear(_ sender: Any) {
        self.latestArray.removeAll()
        
        self.sampleTableView.reloadData()
        
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        
        self.sampleTableView.isHidden = true
    }
    
    @IBAction func apply(_ sender: Any) {
        
        UserDefaults.standard.set(self.latestArray, forKey: "userSelected")
        
        print(UserDefaults.standard.array(forKey: "userSelected"))
        
    }
    
    
    @IBAction func login(_ sender: Any) {
        UserDefaults.standard.set("Y", forKey: "LogStatus")
    }
    
    
    
}

