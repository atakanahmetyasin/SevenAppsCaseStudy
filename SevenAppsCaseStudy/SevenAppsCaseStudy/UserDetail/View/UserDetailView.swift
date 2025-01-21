//
//  UserDetailView.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 20.01.2025.
//

import UIKit

final class UserDetailView: UIView {
    private let phoneLabel: UILabel = {
        let label = UILabel.createLabel(color: .black, font: UIFont.systemFont(ofSize: 12), text: "phone", alignment: .left)
        return label
    }()
    
    private let websiteLabel: UILabel = {
        let label = UILabel.createLabel(color: .black, font: UIFont.systemFont(ofSize: 12), text: "website", alignment: .left)
        return label
    }()
    private let nameLabel: UILabel = {
        let label = UILabel.createLabel(color: .black, font: UIFont.systemFont(ofSize: 16, weight: .bold), text: "name", alignment: .center)
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel.createLabel(color: .black, font: UIFont.systemFont(ofSize: 12), text: "email", alignment: .center)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        let subViews = [nameLabel, emailLabel, phoneLabel, websiteLabel]
        subViews.forEach { addSubview($0) }
    }

    private func setupUI() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            phoneLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            websiteLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10),
            websiteLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func passUI(with userDetail: UsersModel) {
        phoneLabel.text = userDetail.phone
        websiteLabel.text = userDetail.website
        nameLabel.text = userDetail.name 
        emailLabel.text = userDetail.email
    }
}
