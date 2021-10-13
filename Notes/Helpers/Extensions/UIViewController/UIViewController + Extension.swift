//
//  MyNotesViewController + Extension.swift
//  Notes
//
//  Created by Ahmed Abd Elaziz on 02/10/2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setupNavigationControllerWithLargeTitle(_ title: String) {
        let largeFont: UIFont = .toucheSemiBold(size: 30)
        let regularFont: UIFont = .toucheSemiBold(size: 16)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: largeFont, NSAttributedString.Key.foregroundColor: UIColor.customDarkGray]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: regularFont, NSAttributedString.Key.foregroundColor: UIColor.customDarkGray]
        self.navigationItem.backButtonTitle = ""
        navigationItem.hidesSearchBarWhenScrolling = false
        self.title = title
    }
    
    func setupNavigationControllerWithoutLargeTitle(_ title: String) {
        let font: UIFont = .toucheSemiBold(size: 16)
        navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        self.title = title
    }
    
}
