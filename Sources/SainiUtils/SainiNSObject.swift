//
//  File.swift
//  
//
//  Created by Rohit Saini on 06/07/22.
//

import Foundation

extension NSObject {
  public var className: String? {
    return String(describing: type(of: self)).components(separatedBy: ".").last
  }

  public class var className: String? {
    return String(describing: self).components(separatedBy: ".").last
  }
}

