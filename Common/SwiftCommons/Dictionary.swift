// ----------------------------------------------------------------------------
//
//  Dictionary.swift
//
//  @author     Vasily Ivanov <vasily.ivanov.jukebox@gmail.com>
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

extension Dictionary
{
// MARK: - Functions

    /**
    * Filters self returning a dictionary with the same type as opposit to
    * standard filter function with returns an Array of tuples
    *
    * - parameter includeElement: Closure which should return true for included
    *                             elements
    * - returns: A filtered dictionary
    */
    func filterToDictionary(@noescape includeElement: (Element) throws -> Bool)  -> Dictionary
    {
        var result = [Key : Value]()
        
        forEach { (key, value) in
            if (try? includeElement(key, value)) ?? false {
                result[key] = value
            }
        }
        
        return result
    }

}

// ----------------------------------------------------------------------------
