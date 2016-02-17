// ----------------------------------------------------------------------------
//
//  ArrayDataSourceTests.swift
//
//  @author     Vasily Ivanov <vasily.ivanov.jukebox@gmail.com>
//
// ----------------------------------------------------------------------------

import Foundation
import XCTest
@testable import SwiftCommons

// ----------------------------------------------------------------------------

class ArrayDataSourceTests: XCTestCase
{
// MARK: - Properties
    
    var tableView: UITableView!
    var dataSource: ArrayDataSource<String>?
    
// MARK: - Functions

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testArrayDataSource() {
        let data: [String] = ["one", "two", "three"]
        
        self.dataSource = ArrayDataSource(items: data, cellIdentifier: CustomTableViewCell.CellIdentifier, configureBlock: {cell, item in
            guard let customCell = cell as? CustomTableViewCell else {
                XCTFail("Unknown cell type: \(cell)")
                return
            }
            XCTAssert(data.contains(item), "Data array \(data) should contain item \(item)")
            customCell.label.text = item
        })
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        self.tableView.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.CellIdentifier)
        let nib = CustomTableViewCell.nib()
        self.tableView.registerNib(nib, forCellReuseIdentifier: CustomTableViewCell.CellIdentifier)
        self.tableView.dataSource = self.dataSource
        self.tableView.reloadData()
        
//        if let window = UIApplication.sharedApplication().delegate?.window {
//            window?.addSubview(self.tableView)
//            self.tableView.reloadData()
//        }
//        
        sleep(5)
    }

}

// ----------------------------------------------------------------------------
