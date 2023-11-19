//
//  DataManager.swift
//  Mediscan
//
//  Created by Alok Sahay on 18.11.2023.
//

import Foundation
import UIKit


class DataManager {
    
    static let addRecordEndPoint = URL(string: "https://c40a-188-119-60-70.ngrok-free.app/api/new")
    static let getRecordEndPoint = URL(string: "https://c40a-188-119-60-70.ngrok-free.app/api/find")
    static let fetchData = """
    ID: 458fb390-2f32-48f0
    Name: Vitalik.eth
    Date of Birth: 1985-03-22
    Gender: Male
    Ethnicity: Asian
    Emergency contact: SBF
    Phone: +420 420 420
    """
    
    
    static func createNewRecord() {
        // Post record
    }
    
    static func fetchRecord(image: UIImage) {
        // Get image from API
    }
    
}
