// ----------------------------------------------------------------------------
//
//  LimitedQueue.swift
//
//  @author     Vasily Ivanov <vasily.ivanov.jukebox@gmail.com>
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

struct LimitedQueue<Element>
{
// MARK: - Construction
    
    init(size s: Int) {
        self.size = s
        array.reserveCapacity(s)
    }

// MARK: - Properties
    
    var count: Int {
        return array.count
    }
    
// MARK: - Functions
    
    mutating func push(element: Element) {
        if array.count == size {
            array.removeLast()
        }
        array.insert(element, atIndex: 0)
    }
    
    mutating func pushWithPop(element: Element) -> Element? {
        var last: Element?
        if array.count == size {
            last = array.popLast()
        }
        array.insert(element, atIndex: 0)
        return last
    }
    
    func filter(closure: (Element) -> Bool) -> [Element] {
        return array.filter(closure)
    }
    
    //Unsafe intentionally, behavior is
    //same with Array behavior
    subscript(index: Int) -> Element {
        get {
            return array[index]
        }
        set(element) {
            array[index] = element
        }
    }
    
// MARK: - Private properties
    
    private let size: Int
    
    private var array = [Element]()
}

// ----------------------------------------------------------------------------

extension Array
{
    init(_ limitedQueue: LimitedQueue<Element>) {
        self.init(limitedQueue.array)
    }
}

// ----------------------------------------------------------------------------
