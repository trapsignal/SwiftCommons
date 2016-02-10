// ----------------------------------------------------------------------------
//
//  CollectionType.swift
//
//  @author     Vasily Ivanov <vasily.ivanov.jukebox@gmail.com>
//
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------

extension CollectionType where Generator.Element : Hashable
{
    
// MARK: - Functions
    
    /**
    * Create a dictionary with values produced by applying a transform to keys.
    *
    * - parameter transform: A function which maps keys to values.
    */
    func toDictionary<V>(transform: (Generator.Element) -> V) -> [Generator.Element : V]
    {
        var dict = Dictionary<Generator.Element, V>()
        forEach { element in
            dict.updateValue(transform(element), forKey: element)
        }
        return dict
    }
}

// ----------------------------------------------------------------------------
