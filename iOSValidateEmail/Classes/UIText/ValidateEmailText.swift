//
//  ValidateEmailText.swift
//  Pods
//
//  Created by Dustin D'Avignon on 9/17/17.
//
//

import Foundation
import UIKit

public class ValidateEmailText: UITextField {
    // validate email text, not reinventing the wheel: http://multithreaded.stitchfix.com/blog/2016/11/02/email-validation-swift/
    public static func validateEmail(field: UITextField) -> String? {
        guard let trimmedText = field.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            return nil
        }
        
        guard let dataDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
            return nil
        }
        
        let range = NSMakeRange(0, NSString(string: trimmedText).length)
        let allMatches = dataDetector.matches(in: trimmedText,
                                              options: [],
                                              range: range)
        
        if allMatches.count == 1,
            allMatches.first?.url?.absoluteString.contains("mailto:") == true
        {
            return trimmedText
        }
        return nil
    }
}
