//
//  NoteTableViewCell.swift
//  Notes
//
//  Created by Ahmed Abd Elaziz on 02/10/2021.
//

import Foundation
import UIKit

class NoteTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var noteTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .toucheSemiBold(size: 16)
        label.textColor = .customDarkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var title: String {
        return noteTitle.text ?? "Error"
    }
    
    lazy var noteDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .toucheRegular(size: 12)
        label.textColor = .customMediumGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var details: String {
        return noteDescription.text ?? "Error"
    }
    
    private lazy var noteSideLabelColor: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            noteSideLabelColor.topAnchor.constraint(equalTo: containerView.topAnchor),
            noteSideLabelColor.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            noteSideLabelColor.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            noteSideLabelColor.widthAnchor.constraint(equalToConstant: 32),
            
            noteTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            noteTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            noteTitle.trailingAnchor.constraint(equalTo: noteSideLabelColor.leadingAnchor, constant: -16),
            
            noteDescription.topAnchor.constraint(equalTo: noteTitle.bottomAnchor, constant: 16),
            noteDescription.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            noteDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            noteDescription.trailingAnchor.constraint(equalTo: noteSideLabelColor.leadingAnchor, constant: -16),
        ])
    }
    
    func config(_ data: Note) {
        let note = data
        noteTitle.text = note.noteTitle
        noteDescription.text = note.noteDescription
        noteSideLabelColor.backgroundColor = UIColor(note.noteColor ?? "#000000")
    }
    
    private func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(noteSideLabelColor)
        containerView.addSubview(noteTitle)
        containerView.addSubview(noteDescription)
    }
    
    private func setupCellUI() {
        backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    private func layoutUI() {
        addSubviews()
        setupConstraints()
        setupCellUI()
    }
    
}
