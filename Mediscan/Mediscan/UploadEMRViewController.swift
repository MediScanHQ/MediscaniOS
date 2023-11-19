//
//  UploadEMRViewController.swift
//  Mediscan
//
//  Created by Alok Sahay on 18.11.2023.
//

import Foundation
import UIKit

class UploadEMRViewController : UIViewController {
    @IBAction func submitPreferences(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.uploadEMR()
        }
    }
    
    func uploadEMR() {
        let alert = UIAlertController(title: "EMR saved", message: "Your EMR has been uploaded with permissions", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}
