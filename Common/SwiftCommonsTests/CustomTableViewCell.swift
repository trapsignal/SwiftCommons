// ----------------------------------------------------------------------------
//
//  CustomTableViewCell.swift
//
//  @author     Vasily Ivanov <vasily.ivanov.jukebox@gmail.com>
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

class CustomTableViewCell: UITableViewCell
{
// MARK: - Properties

    @IBOutlet weak var label: UILabel!

// MARK: - Constants

    static let CellIdentifier = "CustomTableViewCell"

// MARK: - Functions
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
}

// ----------------------------------------------------------------------------
