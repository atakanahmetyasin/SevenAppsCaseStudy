//
//  UserDetailViewController.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 18.01.2025.
//

import UIKit

// Using AnyObject ensures that only class types can conform this protocol. (You can't conform to structs, enums).
// We use this to make it reference type, that way we can make centralize data management.
// When it's called(for example: delegate pattern) it should be marked as weak to prevent retain cycle.

protocol UserListViewControllerProtocol: AnyObject, NavigationPerformable  { // That way i can access NavigationPerformable protocol's methods.
    func prepareTableView()
    func reloadData()
}

// Used "final" because i am not going to inherit UserDetailVC to any class. It helps to reduce compile time.
final class UserListViewController: UIViewController {
    
    // MARK: Variables
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.identifier)
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
   
    private lazy var viewModel = UserListViewModel(view: self) // Used "lazy" to defer initialization until the viewModel is accessed for the first time. This helps optimize performance and avoid unnecessary resource allocation if the viewModel is not used.

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.viewDidLoad()
        addSubviews()
        setupUI()
    }
    
    // It triggers just before the view added to hierarchy. It triggers everytime the UserDetailVC comes to the screen.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    
    // MARK: SETUP UI
    private func addSubviews() {
        let subViews = [
            tableView
        ]
        subViews.forEach { view.addSubview($0) }
    }
    
    private func setupUI() {
        NSLayoutConstraint.activate ([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension UserListViewController: UserListViewControllerProtocol {
    func prepareTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func reloadData() {
        DispatchQueue.main.async { [weak self] in // Used weak self because it is a closure. We should make it weak, not strong reference to prevent retain cycle and memory leak. Also because it is UI related it should be performed in main thread asynchronously.
            self?.tableView.reloadData()
        }
    }
}

// MARK: TableView Protocols
extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        let user = viewModel.userModel[indexPath.row]
        cell.configure(with: user)
        return cell
    }
}

extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(at: indexPath)
    }
}
