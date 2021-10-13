//
//  MyNotesViewModel.swift
//  Notes
//
//  Created by Ahmed Abd Elaziz on 13/10/2021.
//

import Foundation
import UIKit

class MyNotesViewModel {
    
    weak var dataSource : GenericDataSource<Note>?
    
    init(dataSource : GenericDataSource<Note>?) {
        self.dataSource = dataSource
    }
    
    private var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var notes: [Note]?
    
    func fetchNotes() {
        do {
            self.notes = try context.fetch(Note.fetchRequest())
            self.dataSource?.data.value = notes ?? []
        } catch {
            print(error)
        }
    }
}
