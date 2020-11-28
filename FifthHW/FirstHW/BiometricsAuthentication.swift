//
//  BiometricsAuthentication.swift
//  FirstHW
//
//  Created by Ivan on 28.11.2020.
//

import Foundation
import LocalAuthentication

protocol BiometricsProtocol {
    func biometricsAuthentication(passwordItems: [String : String], completionHandler: @escaping (_ userName: String, _ password: String) -> Void)
}

class BiometricsAuthentication: BiometricsProtocol {
    
    func biometricsAuthentication(passwordItems: [String : String], completionHandler: @escaping (_ userName: String, _ password: String) -> Void) {
        let authenticationContext = LAContext()
        setupAuthenticationContext(context: authenticationContext)
        
        let reason = "Fast and safe authentication in your app"
        var authError: NSError?
        
        if authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
            authenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (success, evaluateError) in
                if success {
                    for (userName, password) in passwordItems {
                       completionHandler(userName, password)
                    }
                } else {
                    if let error = evaluateError {
                        print(error.localizedDescription)
                    }
                }
            }
        } else {
            if let error = authError {
                print(error.localizedDescription)
            }
        }
    }
    
    private func setupAuthenticationContext(context: LAContext) {
        context.localizedReason = "Use for fast and safe authentication in your app"
        context.localizedCancelTitle = "Cancel"
        context.localizedFallbackTitle = "Enter password"
    }
}
