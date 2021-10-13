//
//  ColorsCollectionViewCell.swift
//  Notes
//
//  Created by Ahmed Abd Elaziz on 06/10/2021.
//

import UIKit

class ColorsCollectionViewCell: UICollectionViewCell {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var colorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            colorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            colorView.centerYAnchor.constraint(equalTo: centerYAnchor),
            colorView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 14),
            colorView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 14)
        ])
    }
    
    private func addSubviews() {
        addSubview(colorView)
    }
    
    private func layoutUI() {
        addSubviews()
        setupConstraints()
    }
}
