// ----------------------------------------------------------------------------
//
//  Comparable.swift
//
//  @author     Vasily Ivanov <vasily.ivanov.jukebox@gmail.com>
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

extension Comparable
{
// MARK: - Functions

    func limitedToRange(min min: Self, max: Self) -> Self
    {
        if self > max {
            return max
        }
        else if self < min {
            return min
        }
        return self
    }

}

// ----------------------------------------------------------------------------
