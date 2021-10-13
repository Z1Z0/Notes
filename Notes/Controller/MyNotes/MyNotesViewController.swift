//
//  MyNotesViewController.swift
//  Notes
//
//  Created by Ahmed Abd Elaziz on 01/10/2021.
//

import Foundation
import UIKit

class MyNotesViewController: UIViewController, ButtonDelegate {
    
    let dataSource = MyNotesDataSource()

    lazy var mainView: MyNotesView = {
        let view = MyNotesView(frame: self.view.frame, delegate: self)
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationControllerWithLargeTitle("My note")
        setupSearchController()
        mainView.viewModel.fetchNotes()
        dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.mainView.notesTableView.reloadData()
        }
    }
    
    func buttonAction() {
        let vc = AddNoteViewController()
        self.show(vc, sender: nil)
    }
    
    
    
}
