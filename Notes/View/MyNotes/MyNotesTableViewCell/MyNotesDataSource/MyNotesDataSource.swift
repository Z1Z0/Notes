//
//  MyNotesDataSource.swift
//  Notes
//
//  Created by Ahmed Abd Elaziz on 13/10/2021.
//

import Foundation
import UIKit

class MyNotesDataSource: GenericDataSource<Note>, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as NoteTableViewCell
        cell.config(data.value[indexPath.row])
        return cell
    }
}
