//
//  ViewController.swift
//  tippy
//
//  Created by Joe Leung on 3/2/17.
//  Copyright © 2017 Joe Leung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    var tipPercentageArray : [Int] = [18, 20, 25]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        tipControl.setTitle(String(format:"%d%%", tipPercentageArray[0]), forSegmentAt:0)
        tipControl.setTitle(String(format:"%d%%", tipPercentageArray[1]), forSegmentAt:1)
        tipControl.setTitle(String(format:"%d%%", tipPercentageArray[2]), forSegmentAt:2)
        
        calculateTipSender()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

   
    @IBAction func changeBillAmount(_ sender: Any) {
            calculateTipSender()
    }
    
    @IBAction func changeTipPercentage(_ sender: Any) {
            calculateTipSender()
    }
    
    func calculateTipSender() {
        //let tipPercentages = [0.18, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * (Double(tipPercentageArray[tipControl.selectedSegmentIndex])/100.0)
        let total = bill + tip
        
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text =  String(format:"$%.2f", total)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let settingsViewController = segue.destination as! SettingsViewController
        
        settingsViewController.tipPercentageArray = tipPercentageArray
        settingsViewController.previousViewController = self
    }
}

