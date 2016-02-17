// ----------------------------------------------------------------------------
//
//  ArrayDataSource.swift
//
//  @author     Vasily Ivanov <vasily.ivanov.jukebox@gmail.com>
//
//  Inspired by https://github.com/objcio/issue-1-lighter-view-controllers
// ----------------------------------------------------------------------------

import Foundation
import UIKit

// ----------------------------------------------------------------------------

class ArrayDataSource<Element>: NSObject, UITableViewDataSource
{
    // MARK: - Construction
    
    init(items: [Element], cellIdentifier: String, configureBlock: ConfigureBlock)
    {
        self.items = items
        self.cellIdentifier = cellIdentifier
        self.configureBlock = configureBlock
    }
    
    // MARK: - Functions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard indexPath.row < self.items.count else {
            print("\(__FUNCTION__): index \(indexPath.row) is out of array count \(self.items.count)")
            return UITableViewCell(style: .Default, reuseIdentifier: self.cellIdentifier)
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath)
        let item = self.items[indexPath.row]
        self.configureBlock(cell, item)
        return cell
    }
    
    // MARK: - Inner Types
    
    typealias ConfigureBlock = (UITableViewCell, Element) -> Void
    
    // MARK: - Variables
    
    private let items: [Element]
    
    private let cellIdentifier: String
    
    private let configureBlock: ConfigureBlock
    
}

// ----------------------------------------------------------------------------
