// ----------------------------------------------------------------------------
//
//  LimitedQueue.swift
//
//  @author     Vasily Ivanov <vasily.ivanov.jukebox@gmail.com>
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public struct LimitedQueue<Element>
{
// MARK: - Construction
    
    public init(size s: Int) {
        self.size = s
        array.reserveCapacity(s)
    }

// MARK: - Properties
    
    public let size: Int
    
    public var count: Int {
        return array.count
    }
    
// MARK: - Functions
    
    public mutating func push(element: Element) {
        if array.count == size {
            array.removeLast()
        }
        array.insert(element, atIndex: 0)
    }
    
    public mutating func pushWithPop(element: Element) -> Element? {
        var last: Element?
        if array.count == size {
            last = array.popLast()
        }
        array.insert(element, atIndex: 0)
        return last
    }
    
    public func filter(@noescape closure: (Element) -> Bool) -> [Element] {
        return array.filter(closure)
    }
    
    //Unsafe intentionally, behavior is
    //same with Array behavior
    public subscript(index: Int) -> Element {
        get {
            return array[index]
        }
        set(element) {
            array[index] = element
        }
    }
    
// MARK: - Private properties
    
    private var array = [Element]()
}

// ----------------------------------------------------------------------------

extension Array
{
    public init(_ limitedQueue: LimitedQueue<Element>) {
        self.init(limitedQueue.array)
    }
}

// ----------------------------------------------------------------------------
