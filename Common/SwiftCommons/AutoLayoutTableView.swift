// ----------------------------------------------------------------------------
//
//  AutoLayoutTableView.swift
//
//  @author     Vasily Ivanov <vasily.ivanov.jukebox@gmail.com>
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

class AutoLayoutTableView: UITableView
{
    // MARK: - Functions
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.heightConstraint = NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 0)
        addConstraint(heightConstraint)
    }
    
    override func reloadData() {
        super.reloadData()
        self.heightConstraint.constant = self.contentSize.height
    }
    
    // MARK: - Private Properties
    
    var heightConstraint: NSLayoutConstraint!
}

// ----------------------------------------------------------------------------
