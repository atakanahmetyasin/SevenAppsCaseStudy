//
//  UserTableViewCell.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 20.01.2025.
//

import UIKit
final class UserTableViewCell: UITableViewCell {
    
  static let identifier = "userCell"
    
    private let nameLabel: UILabel = {
        let label = UILabel.createLabel(color: .black, font: UIFont.systemFont(ofSize: 12), text: "name", alignment: .left)
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel.createLabel(color: .black, font: UIFont.systemFont(ofSize: 12), text: "email", alignment: .left)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        let subViews = [nameLabel, emailLabel]
        subViews.forEach { contentView.addSubview($0) }
    }
    
    private func setupUI() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            emailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with user: UsersModel) {
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}

