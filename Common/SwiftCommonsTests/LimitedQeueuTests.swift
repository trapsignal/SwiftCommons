// ----------------------------------------------------------------------------
//
//  LimitedQeueuTests.swift
//
//  @author     Vasily Ivanov <vasily.ivanov.jukebox@gmail.com>
//
// ----------------------------------------------------------------------------

import Foundation
import XCTest
@testable import SwiftCommons

// ----------------------------------------------------------------------------

class LimitedQeueuTests: XCTestCase
{
// MARK: - Functions

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCommon() {
        let queueSize = 5
        var queue = LimitedQueue<Int>(size: queueSize)
        XCTAssert(queue.size == queueSize, "Queue size should equal to initial value always")
        XCTAssert(queue.count == 0, "Queue count should 0 right after queue creation")
        
        let item1 = 3
        let popItem1 = queue.pushWithPop(item1)
        XCTAssert(popItem1 == nil, "Popping from empty queue results in a nil value")
        
        let item2 = 45
        let popItem2 = queue.pushWithPop(item2)
        XCTAssert(popItem2 == nil, "Popping from non-full queue results in nil value")
        
        XCTAssert(queue.count == 2, "Queue count should be equal to a number of pushed items")
        
        let item3 = 12
        let item4 = 32
        let item5 = 74396946
        
        queue.push(item3)
        queue.push(item4)
        queue.push(item5)
        
        XCTAssert(queue.count == 5, "Queue count should be equal to a number of pushed items")
        
        let item6 = 654
        let popItem6 = queue.pushWithPop(item6)
        XCTAssert(popItem6 == item1, "Popping from full queue results in a most old value")
        XCTAssert(queue.count == 5, "Queue count should be equal to a number of pushed items limited by queue size")
    }

}

// ----------------------------------------------------------------------------
