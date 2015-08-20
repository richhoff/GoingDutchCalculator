//
//  ViewController.swift
//  Going Dutch Calculator Example for Educational purpose only
//
//  Created by Richard Hoffmann @ Area 1 on 25/07/2015.
//  Copyright (c) 2015 Area 1. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UIAlertViewDelegate,
    UIActionSheetDelegate
    // add UIAlertViewDelegate,
{

    @IBOutlet var amountInput: UITextField!
    @IBOutlet var tipTextField: UITextField!
    @IBOutlet var poepleTextField: UITextField!
    @IBOutlet var totalTextField: UITextField!
    
    @IBOutlet var caclButton: UIButton!
    @IBOutlet var tipSegmentedControl: UISegmentedControl!
    
    @IBOutlet var tipView: UIView!
    @IBOutlet var dutchView: UIView!
    @IBOutlet var viewSelectSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipSegmentedControl.selectedSegmentIndex = 1
        
        viewSelectSegmentedControl.selectedSegmentIndex = 1
        tipView.hidden = true
        dutchView.hidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func viewSelectAction(sender: AnyObject) {
        if sender.selectedSegmentIndex == 0 {
            tipView.hidden = false
            dutchView.hidden = true
        }
        else {
            tipView.hidden = true
            dutchView.hidden = false
        }
    }

    @IBAction func calcAction(sender: AnyObject) {
        totalTextField.text = "\(amountInput.text + tipTextField.text)"
    }

    @IBAction func amountAction(sender: UITextField) {
        var amount : Double = (sender.text as NSString).doubleValue
        var tip : Double = (tipTextField.text as NSString).doubleValue
        var people : Double = (poepleTextField.text as NSString).doubleValue
//        if( people == "" )
        
        var total : Double = (amount + tip) / people
        totalTextField.text = "\(total)"
        
        let cat = "🐱"; println(cat)
        
        let alert = UIAlertView()
        alert.delegate = self // call back to Handle action
        alert.title = "Alert"
        alert.message = "Here's a message \(cat)"
        alert.addButtonWithTitle("OK")
        alert.addButtonWithTitle("Cancel")
        alert.addButtonWithTitle("Maybe")
        alert.show()
    }
    
    @IBAction func tipSegmentAction(sender: AnyObject) {
        switch sender.selectedSegmentIndex {
            case 0:
                tipTextField.text = "10"
            case 1:
                tipTextField.text = "15"
            case 2:
                tipTextField.text = "20"
            default:
                println("default")
            
        }
    }
    
    @IBAction func calcAmountAction(sender: AnyObject) {
        amountAction( amountInput )
    }

    // Unwind function
    @IBAction func cancelViewController(segue:UIStoryboardSegue) {
        let alert = UIAlertView()
        alert.delegate = self // call back to Handle action
        alert.title = "Alert"
        alert.message = "Bye!"
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    
    @IBAction func MoreBtnClicked(sender: AnyObject)
    {
        AlertMultiSelectShow()
    }
    
    func AlertMultiSelectShow()
    {
        var moreAlert=UIAlertView(title: "Photo", message: "", delegate: self, cancelButtonTitle: "No Thanks!", otherButtonTitles: "Save Image", "Email", "Facebook", "Whatsapp" )
        moreAlert.show()
        moreAlert.tag=111;
    }
    
    func AlertActionSheetShow()
    {
        var cancelText : String? = nil
        AlertActionSheetShow( cancelText )
    }
    
    func AlertActionSheetShow( cancelText: String? )  // cancel : Bool,
    {
        let actionSheet = UIActionSheet(title: "ActionSheet", delegate: self, cancelButtonTitle: cancelText, destructiveButtonTitle: "Done", otherButtonTitles: "Yes", "No")
        actionSheet.showInView(self.view)
    }
    
    // Handler for alertView
    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int)
    {
        if alertView.tag==111
        {
            if buttonIndex==0
            {
                println("No Thanks!")
            }
            else if buttonIndex==1
            {
                println("Save Image")
            }
            else if buttonIndex == 2
            {
                println("Email")
            }
            else if buttonIndex == 3
            {
                println("Facebook")
            }
            else if buttonIndex == 4
            {
                println("Whatsapp")
            }
        }
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int)
    {
        switch buttonIndex{
        case 0:
            NSLog("Done");
        case 1:
            NSLog("Cancel");
        case 2:
            NSLog("Yes");
        case 3:
            NSLog("No");
        default:
            NSLog("Default");
            
        }
    }
    
}

