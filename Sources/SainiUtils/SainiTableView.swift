//
//  SainiTableView.swift
//  SainiExtensions
//
//  Created by Rohit Saini on 29/10/19.
//  Copyright © 2019 Rohit Saini. All rights reserved.
//

import Foundation
import UIKit


//MARK:- UITableView
extension UITableView {
    
    //MARK:- setEmptyMessage
    public func sainiSetEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
        self.separatorStyle = .none;
    }
    //MARK:- sainiRestore
    public func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

extension UITableView {
  public func validate(_ indexPath: IndexPath) -> Bool {
    return indexPath.section < numberOfSections && indexPath.row >= numberOfRows(inSection: indexPath.section)
  }

  public func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
    guard let lastIndexPath = indexPathsForVisibleRows?.last else {
      return false
    }
    return lastIndexPath == indexPath
  }

  public func register<T: UITableViewCell>(_ cellType: T.Type) {
    if let className = cellType.className {
      let nib = UINib(nibName: className, bundle: nil)
      register(nib, forCellReuseIdentifier: className)
    }
  }

  public func register<T: UITableViewCell>(_ cellTypes: [T.Type]) {
    cellTypes.forEach { register($0) }
  }

  public func registerHeaderFooterViews<T: UITableViewHeaderFooterView>(_ views: [T.Type]) {
    views.forEach {
      register(UINib(nibName: $0.name, bundle: nil), forHeaderFooterViewReuseIdentifier: $0.name)
    }
  }
}

extension UITableView {
  // Call on viewDidLayoutSubviews to automatically calculate and set header height
  public func autoHeaderHeight() {
    guard let headerView = tableHeaderView else {
      return
    }

    let size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    if headerView.frame.size.height != size.height {
      headerView.frame.size.height = size.height
      tableHeaderView = headerView
      layoutIfNeeded()
    }
  }
}
