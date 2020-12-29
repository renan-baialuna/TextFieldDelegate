//
//  MoneyTextFieldDelegate.swift
//  TextDelegate
//
//  Created by Renan Baialuna on 29/12/20.
//

import Foundation
import UIKit

class MoneyTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let safeText = textField.text else {
            return false
        }
        
        var newText = safeText.replacingOccurrences(of: "$", with: "")
        newText = newText.replacingOccurrences(of: ",", with: "")
        newText = processString(text: newText, string: string)
        newText = removeZero(entry: newText)
        newText = setStringBack(entry: newText)
        textField.text = newText
        return false
    }
    
    func removeZero(entry: String) -> String {
        if let intEntry = Int(entry) {
            return String(intEntry)
        } else {
            return ""
        }
    }
    
    func processString(text: String, string: String) -> String {
        var retString = text
        let  char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        if (isBackSpace == -92) && (text.count) > 0 {
               retString.removeLast()
        } else {
            retString = retString + string
        }
        return retString
    }
    
    func setStringBack(entry: String) -> String {
        var retString = entry
        while retString.count < 3 {
            retString.insert("0", at: retString.startIndex)
        }
        retString.insert("$", at: retString.startIndex)
        retString.insert(",", at: retString.index(retString.startIndex, offsetBy: (retString.count - 2)))
        return retString
    }
}
