//
//  SainiCodable.swift
//  SainiUtils
//
//  Created by Rohit Saini on 07/06/20.
//

import Foundation
import UIKit

extension Encodable {
  
  //MARK:-  Converting object to postable JSON
  public func toJSON(_ encoder: JSONEncoder = JSONEncoder()) -> [String: Any] {
    guard let data = try? encoder.encode(self) else { return [:] }
    guard let object = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else { return [:] }
    guard let json = object as? [String: Any] else { return [:] }
    return json
  }

  public func toData(_ encoder: JSONEncoder = JSONEncoder()) -> Data {
    guard let data = try? encoder.encode(self) else { return Data() }
    return data
  }
}
