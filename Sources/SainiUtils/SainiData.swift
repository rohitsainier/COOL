//
//  SainiData.swift
//  SainiUtils
//
//  Created by Rohit Saini on 07/06/20.
//

import Foundation
import UIKit


extension Data {
    //MARK:- Convert Data into pretty json format
    public var sainiPrettyJSON: String { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = String(data: data, encoding: .utf8) else { return "" }

        return prettyPrintedString
    }
    
    public mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
