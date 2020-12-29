//
//  CepTextFieldDelegate.swift
//  TextDelegate
//
//  Created by Renan Baialuna on 28/12/20.
//

import Foundation
import UIKit

class CepTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text!.count + string.count > 5 {
            return false
        }
        return true
    }
}
