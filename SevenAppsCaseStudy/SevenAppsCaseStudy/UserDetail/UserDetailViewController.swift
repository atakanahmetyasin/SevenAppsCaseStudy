//
//  UserDetailViewController.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 20.01.2025.
//

import UIKit

final class UserDetailViewController: UIViewController {
    private let userDetailView = UserDetailView()
    private let user: UsersModel
    
    init(user: UsersModel) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = userDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        userDetailView.passUI(with: user)
    }
}
