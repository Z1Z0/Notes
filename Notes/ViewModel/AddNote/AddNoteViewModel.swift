//
//  AddNoteViewModel.swift
//  Notes
//
//  Created by Ahmed Abd Elaziz on 12/10/2021.
//

import Foundation
import CoreData
import UIKit

class AddNoteViewModel {
    private var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func createNewNote(_ title: String, _ details: String, _ color: String) {
        let newNote = Note(context: context)
        newNote.noteTitle = title
        newNote.noteDescription = details
        newNote.noteColor = color
        do {
            try self.context.save()
        } catch {
            print(error)
        }
    }
    
    
}
