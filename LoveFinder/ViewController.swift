//
//  ViewController.swift
//  LoveFinder
//
//  Created by 杨艾平 on 16/3/16.
//  Copyright © 2016年 yap. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var gander: UISegmentedControl!
    
    @IBOutlet weak var birthday: UIDatePicker!
    
    @IBOutlet weak var height: UISlider!
    
    @IBOutlet weak var heightNum: UILabel!
    
    @IBOutlet weak var house: UISwitch!
    
    @IBOutlet weak var result: UITextView!
    
    @IBOutlet weak var confirm: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func heightChange(sender: AnyObject) {
        let slider = sender as! UISlider
        let i = Int(slider.value)
        slider.value = Float(i)
        heightNum.text = "\(i)cm"
    }
    
    @IBAction func confirmClicked(sender: AnyObject) {
        let genderText = gander.selectedSegmentIndex == 0 ? "高富帅" : "白富美";
        
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now = NSDate()
        let component = gregorian!.components(NSCalendarUnit.Year, fromDate: birthday.date, toDate: now, options: NSCalendarOptions(rawValue: 0))
        let age = component.year
        
//        let year = Int(("\(birthday.date)" as NSString).substringWithRange(NSMakeRange(0, 4)))!
//        let now = Int(("\(NSDate())" as NSString).substringWithRange(NSMakeRange(0, 4)))!
//        let age = now - year
        
        let houseText = house.on ? "有房" : "没房"
        
        result.text = "\(name.text!), \(age)岁, \(genderText), 身高\(heightNum.text!), \(houseText), 求交往"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        name.resignFirstResponder()
        return true;
    }
}

