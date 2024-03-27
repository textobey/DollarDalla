//
//  DollarDalla++Bundle.swift
//  DollarDalla
//
//  Created by 이서준 on 3/27/24.
//

import Foundation

// MARK: for yahoofinance
extension Bundle {
    var apiBaseURL: String {
        guard let apiBaseURL = privateDictionary["API_BASE_URL"] as? String else {
            fatalError("API_BASE_URL 정보가 존재하지 않습니다.")
        }
        return apiBaseURL
    }
}

// TODO: for Google Sheet API
extension Bundle {
    private var fileURL: URL {
        guard let fileURL = self.url(forResource: "Info", withExtension: "plist") else {
            fatalError("Info.plist URL 정보를 불러오는데 실패했습니다.")
        }
        return fileURL
    }
    
    private var privateDictionary: NSDictionary {
        guard let data = try? Data(contentsOf: fileURL),
              let dictionary = try? PropertyListSerialization.propertyList(from: data, format: nil) as? NSDictionary else {
            fatalError("Info.plist Key, Value 정보를 불러오는데 실패했습니다.")
        }
        return dictionary
    }
    
    var clientEmail: String {
        guard let clientEmail = privateDictionary["CLIENT_EMAIL"] as? String else {
            fatalError("CLIENT_EMAIL 정보가 존재하지 않습니다.")
        }
        return clientEmail
    }
    
    var privateKey: String {
        guard let clientEmail = privateDictionary["PRIVATE_KEY"] as? String else {
            fatalError("PRIVATE_KEY 정보가 존재하지 않습니다.")
        }
        return clientEmail
    }
    
    var privateKeyId: String {
        guard let clientEmail = privateDictionary["PRIVATE_KEY_ID"] as? String else {
            fatalError("PRIVATE_KEY_ID 정보가 존재하지 않습니다.")
        }
        return clientEmail
    }
}
