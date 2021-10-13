//
//  Note+CoreDataProperties.swift
//  Notes
//
//  Created by Ahmed Abd Elaziz on 12/10/2021.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var noteDescription: String?
    @NSManaged public var noteTitle: String?
    @NSManaged public var noteColor: String?

}

extension Note : Identifiable {

}
