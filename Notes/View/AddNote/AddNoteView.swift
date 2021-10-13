//
//  AddNoteView.swift
//  Notes
//
//  Created by Ahmed Abd Elaziz on 04/10/2021.
//

import Foundation
import UIKit

@objc protocol AddNewNoteDelegate: AnyObject {
    func addNewNote()
}

class AddNoteView: UIView, UITextViewDelegate {
    
    var color: UIColor?
    
    private let colors: [UIColor] = [.customBlueGreen, .customGreen, .customPurple, .customWatermelon, .customLightOrange, .customDarkGray]
    
    private weak var saveNoteDelegate: ButtonDelegate?
    
    private weak var newNoteDelegate: AddNewNoteDelegate?

    init(frame: CGRect, saveNoteDelegate: ButtonDelegate, newNoteDelegate: AddNewNoteDelegate) {
        super.init(frame: frame)
        backgroundColor = .customLightCyan
        self.saveNoteDelegate = saveNoteDelegate
        self.newNoteDelegate = newNoteDelegate
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var colorsCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumInteritemSpacing = (((UIScreen.main.bounds.width) - (UIScreen.main.bounds.width / 14) * 6) - 64) / 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(ColorsCollectionViewCell.self, forCellWithReuseIdentifier: "ColorsCollectionViewCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var noteTextViewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.roundCorners([.topLeft, .topRight], radius: 24)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var noteTitleTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        let font: UIFont = .toucheBold(size: 16)
        textField.font = font
        textField.textColor = .customDarkGray
        textField.attributedPlaceholder = NSAttributedString(string: "Note title", attributes: [NSAttributedString.Key.foregroundColor: UIColor.customMediumGray, NSAttributedString.Key.font: font])
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var noteTitle: String {
        get {
            return noteTitleTextField.text ?? "Error"
        }
        
        set {
            noteTitleTextField.text = newValue
        }
        
    }
    
    private lazy var noteDetailsTextView: UITextView = {
        let textView = UITextView()
        textView.delegate = self
        textView.backgroundColor = .white
        let font: UIFont = .toucheMedium(size: 14)
        textView.font = font
        textView.autocapitalizationType = .none
        textView.autocorrectionType = .default
        textView.textColor = .customDarkGray
        textView.placeholder = "Enter note"
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    var noteDetails: String {
        get {
            return noteDetailsTextView.text
        }
        
        set {
            noteDetailsTextView.text = newValue
        }
    }
    
    private lazy var saveAddButtonsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [saveAddButtonContainer])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.backgroundColor = .clear
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var saveAddButtonContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var saveNoteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .toucheSemiBold(size: 14)
        button.backgroundColor = .customLightOrange
        button.layer.cornerRadius = 8
        button.addTarget(saveNoteDelegate, action: #selector(saveNoteDelegate?.buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var addNewNoteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .toucheSemiBold(size: 14)
        button.backgroundColor = .customLightOrange
        button.layer.cornerRadius = 8
        button.addTarget(newNoteDelegate, action: #selector(newNoteDelegate?.addNewNote), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            colorsCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            colorsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            colorsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            colorsCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 14),
            
            noteTextViewContainer.topAnchor.constraint(equalTo: colorsCollectionView.bottomAnchor, constant: 32),
            noteTextViewContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            noteTextViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            noteTextViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            lineView.topAnchor.constraint(equalTo: noteTextViewContainer.topAnchor, constant: 16),
            lineView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 4),
            lineView.widthAnchor.constraint(equalToConstant: self.frame.width / 8),
            
            noteTitleTextField.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 16),
            noteTitleTextField.leadingAnchor.constraint(equalTo: noteTextViewContainer.leadingAnchor, constant: 16),
            noteTitleTextField.trailingAnchor.constraint(equalTo: noteTextViewContainer.trailingAnchor, constant: -16),
            noteTitleTextField.heightAnchor.constraint(equalToConstant: 45),
            
            noteDetailsTextView.topAnchor.constraint(equalTo: noteTitleTextField.bottomAnchor, constant: 16),
            noteDetailsTextView.leadingAnchor.constraint(equalTo: noteTextViewContainer.leadingAnchor, constant: 16),
            noteDetailsTextView.trailingAnchor.constraint(equalTo: noteTextViewContainer.trailingAnchor, constant: -16),
            noteDetailsTextView.bottomAnchor.constraint(equalTo: noteTextViewContainer.bottomAnchor),
            
            saveAddButtonsStackView.bottomAnchor.constraint(equalTo: noteTextViewContainer.bottomAnchor, constant: -32),
            saveAddButtonsStackView.leadingAnchor.constraint(equalTo: noteTextViewContainer.leadingAnchor, constant: 16),
            saveAddButtonsStackView.trailingAnchor.constraint(equalTo: noteTextViewContainer.trailingAnchor, constant: -16),
            saveAddButtonsStackView.heightAnchor.constraint(equalToConstant: 45),
            
            saveNoteButton.topAnchor.constraint(equalTo: saveAddButtonContainer.topAnchor, constant: 0),
            saveNoteButton.bottomAnchor.constraint(equalTo: saveAddButtonContainer.bottomAnchor, constant: 0),
            saveNoteButton.trailingAnchor.constraint(equalTo: saveAddButtonContainer.trailingAnchor, constant: 0),
            saveNoteButton.leadingAnchor.constraint(equalTo: addNewNoteButton.trailingAnchor, constant: 16),
            
            addNewNoteButton.leadingAnchor.constraint(equalTo: saveAddButtonContainer.leadingAnchor),
            addNewNoteButton.heightAnchor.constraint(equalToConstant: 45),
            addNewNoteButton.widthAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    private func addSubviews() {
        addSubview(colorsCollectionView)
        addSubview(noteTextViewContainer)
        noteTextViewContainer.addSubview(lineView)
        noteTextViewContainer.addSubview(noteTitleTextField)
        noteTextViewContainer.addSubview(noteDetailsTextView)
        noteTextViewContainer.addSubview(saveAddButtonsStackView)
        saveAddButtonContainer.addSubview(saveNoteButton)
        saveAddButtonContainer.addSubview(addNewNoteButton)
    }
    
    private func layoutUI() {
        addSubviews()
        setupConstraints()
    }
    
}

extension AddNoteView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorsCollectionViewCell", for: indexPath) as! ColorsCollectionViewCell
        cell.colorView.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 14, height: UIScreen.main.bounds.width / 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ColorsCollectionViewCell
        UIView.animate(withDuration: 0.3) {
            cell.colorView.layer.borderWidth = 1
            cell.colorView.layer.borderColor = UIColor.white.cgColor
        }
        self.color = cell.colorView.backgroundColor
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ColorsCollectionViewCell
        UIView.animate(withDuration: 0.3) {
            cell.colorView.layer.borderWidth = 1
            cell.colorView.layer.borderColor = UIColor.clear.cgColor
        }
    }
}
