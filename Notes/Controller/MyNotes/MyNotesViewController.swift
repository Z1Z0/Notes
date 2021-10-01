//
//  MyNotesViewController.swift
//  Notes
//
//  Created by Ahmed Abd Elaziz on 01/10/2021.
//

import Foundation
import UIKit

class MyNotesViewController: UIViewController {
    
    lazy var mainView: MyNotesView = {
        let view = MyNotesView(frame: self.view.frame)
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
