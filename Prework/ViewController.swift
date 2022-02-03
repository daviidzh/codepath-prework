//
//  ViewController.swift
//  Prework
//
//  Created by David Zhao-Dian on 2/2/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var partySizeBar: UISlider!
    @IBOutlet weak var billBackground: UIImageView!
    @IBOutlet weak var perPersonTip: UILabel!
    @IBOutlet weak var perPersonTotal: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        billBackground.layer.cornerRadius = 8
        tipControl.selectedSegmentIndex = 0
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get total tip by multiplying tip by tipPercentage
        let tipPercentages = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update tip and total amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func displayPartySize(_ sender: Any) {
        let partySize = Int(partySizeBar.value)
        partySizeLabel.text = String(partySize)
    }
    @IBAction func calculateTipDistribution(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get total tip by multiplying tip by tipPercentage
        let tipPercentages = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let perPerson = tip / Double(partySizeBar.value)
        perPersonTip.text = String(format: "$%.2f", perPerson)
    }
    @IBAction func slideValueChange(_ sender: Any) {
        partySizeBar.setValue(partySizeBar.value.rounded(.down), animated: true)
    }
    
    @IBAction func calculateTotalDistribution(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get total tip by multiplying tip by tipPercentage
        let tipPercentages = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let perPerson = total / Double(partySizeBar.value)
        perPersonTotal.text = String(format: "$%.2f", perPerson)
    }
    
}

