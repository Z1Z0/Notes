//
//  MyNotesViewController + Extension.swift
//  Notes
//
//  Created by Ahmed Abd Elaziz on 04/10/2021.
//

import Foundation
import UIKit

extension MyNotesViewController {
    
    internal func setupSearchController() {
        navigationItem.searchController = mainView.noteSearchBar
    }
    
}
