//
//  UserListViewModel.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 18.01.2025.
//


import Foundation
// ViewModel should never import UIKit (Same with Presenter and Interactor in VIPER arhitecture)

protocol UserListViewModelProtocol: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func fetchUsers() async
    func didSelectItemAt(at indexPath: IndexPath)
}

final class UserListViewModel {
   private weak var view: UserListViewControllerProtocol? // It is weak to prevent retain cycle. If it is not weak, when we deinit viewController, ViewModel cannot be deinit, it causes memory leak.
    var userModel: [UsersModel] = []
    
    init(view: UserListViewControllerProtocol) {
        self.view = view
    }
}

extension UserListViewModel: UserListViewModelProtocol {
   
    func fetchUsers() async {
        let response = await API.Users.users.fetch(requestModel: [UsersModel].self)
        switch response {
        case .success(let data):
            DispatchQueue.main.async { [ weak self ] in
                LoadingView.shared.startLoading()
                self?.userModel = data
                self?.view?.reloadData()
                LoadingView.shared.hideLoading()
            }
        case .failure(let error):
            print("Error:", error.localizedDescription)
        }
    }
    
    func viewDidLoad() {
        view?.prepareTableView()
        Task {
            await fetchUsers()
        }
    }
    
    func viewWillAppear() {
        
    }
    
    func didSelectItemAt(at indexPath: IndexPath) {
        let selectedUser = userModel[indexPath.row]
        let detailVC = UserDetailViewController(user: selectedUser)
        view?.navigationPush(controller: detailVC, animated: true)
    }
}
