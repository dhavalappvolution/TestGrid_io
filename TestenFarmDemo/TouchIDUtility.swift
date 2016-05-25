//
//  TouchIDUtility.swift
//  RepuEmp
//
//  Created by Harry on 2/18/16.
//  Copyright © 2016 Harry. All rights reserved.
//

import UIKit
import LocalAuthentication

class TouchIDUtility {
    
    func authenticateUser(success succeed: (() -> ())? = nil, failure fail: (NSError -> ())? = nil) {
        if fail == nil && succeed == nil { return }
        
        // Get the current authentication context
        if #available(iOS 8.0, *) {
            
            let context : LAContext = LAContext()
            var error : NSError?
            let myLocalizedReasonString : NSString = "Authentification is required"
            
            // Check if the device is compatible with TouchID and can evaluate the policy.
            if context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
                context.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString as String, reply: { (success : Bool, evaluationError : NSError?) -> Void in
                    if success {
                        if let succeed = succeed {
                            dispatch_async(dispatch_get_main_queue()) {
                                succeed()
                            }
                        }
                    } else {
                        if let fail = fail {
                            dispatch_async(dispatch_get_main_queue()) {
                                fail(evaluationError!)
                            }
                        }
                    }
                })
            } else {
                if let fail = fail {
                    dispatch_async(dispatch_get_main_queue()) {
                        fail(error!)
                    }
                }
            }
        } else {
            // Fallback on earlier versions
            fatalError("Will not be working in below iOS 8.0 version")
        }
        
    }
}
