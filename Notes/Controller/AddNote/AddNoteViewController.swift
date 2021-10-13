//
//  AddNoteViewController.swift
//  Notes
//
//  Created by Ahmed Abd Elaziz on 04/10/2021.
//

import UIKit

class AddNoteViewController: UIViewController, ButtonDelegate, AddNewNoteDelegate {
    
    lazy var mainView: AddNoteView = {
        let view = AddNoteView(frame: self.view.frame, saveNoteDelegate: self, newNoteDelegate: self)
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
        setupNavigationControllerWithoutLargeTitle("New note")
    }
    
    func buttonAction() {
        let viewModel = AddNoteViewModel()
        viewModel.createNewNote(mainView.noteTitle, mainView.noteDetails, mainView.color?.toHexString() ?? "#000000")
        self.navigationController?.popViewController(animated: true)
    }
    
    func addNewNote() {
        let viewModel = AddNoteViewModel()
        viewModel.createNewNote(mainView.noteTitle, mainView.noteDetails, mainView.color?.toHexString() ?? "#000000")
        mainView.noteDetails = ""
        mainView.noteTitle = ""
    }

}
