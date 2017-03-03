//
//  SettingsViewController.swift
//  tippy
//
//  Created by Joe Leung on 3/2/17.
//  Copyright © 2017 Joe Leung. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {
    
    var tipPercentageArray : [Int] = [1,2,3]
    var previousViewController : ViewController?
    
    @IBOutlet weak var percentage1: UITextField!
    
    
    @IBOutlet var percentage: UITextField!
    @IBOutlet var percentage2: UITextField!
    @IBOutlet var percentage3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        percentage.text = String(format:"%d", tipPercentageArray[0])
        percentage2.text = String(format:"%d", tipPercentageArray[1])
        percentage3.text = String(format:"%d", tipPercentageArray[2])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func changePercent(_ sender: Any) {
        previousViewController?.tipPercentageArray[0] = Int(percentage.text!) ?? 0
    }
    
    @IBAction func changePercent2(_ sender: Any) {
        previousViewController?.tipPercentageArray[1] = Int(percentage2.text!) ?? 0
    }
    
    @IBAction func changePercent3(_ sender: Any) {
        previousViewController?.tipPercentageArray[2] = Int(percentage3.text!) ?? 0
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
