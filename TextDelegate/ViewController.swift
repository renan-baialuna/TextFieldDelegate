//
//  ViewController.swift
//  TextDelegate
//
//  Created by Renan Baialuna on 28/12/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cepTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var onOffTextField: UITextField!
    @IBOutlet weak var enableTextfield: UISwitch!
    var delegateCep: CepTextFieldDelegate!
    var delegateValue: MoneyTextFieldDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateCep = CepTextFieldDelegate()
        delegateValue = MoneyTextFieldDelegate()
        cepTextField.delegate = delegateCep
        valueTextField.delegate = delegateValue
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func switchOn(_ sender: Any) {
        onOffTextField.isUserInteractionEnabled = enableTextfield.isOn
    }
    

}

extension ViewController: UITextFieldDelegate {
    
}
