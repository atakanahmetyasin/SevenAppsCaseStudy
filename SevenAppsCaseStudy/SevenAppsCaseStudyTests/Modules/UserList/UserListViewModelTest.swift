//
//  UserListViewModelTest.swift
//  SevenAppsCaseStudyTests
//
//  Created by Ahmet Yasin Atakan on 21.01.2025.
//

import XCTest
#if DEVELOPMENT
@testable import SevenAppsCaseStudyDev
#elseif PRODUCTION
@testable import SevenAppsCaseStudyProd
#endif

final class UserListViewModelTests: XCTestCase {
    private var viewModel: UserListViewModel!
    private var mockView: MockUserListViewController!
    private var mockNetwork: MockNetwork!

    override func setUp() {
        super.setUp()
        mockView = MockUserListViewController()
        mockNetwork = MockNetwork()
        viewModel = UserListViewModel(view: mockView)
    }
    
    override func tearDown() {
        viewModel = nil
        mockView = nil
        mockNetwork = nil
        super.tearDown()
    }
    
    func testViewDidLoad_CallsPrepareTableViewAndFetchUsers() {
        viewModel.viewDidLoad()

        XCTAssertTrue(mockView.invokedPrepareTableView, "prepareTableView should be called")
    }
    
    func testFetchUsers_Failure() async {
        await viewModel.fetchUsers()
        
        // Assert
        XCTAssertTrue(mockView.invokedReloadData == false, "reloadData should not be called on failure")
    }
    
    func testDidSelectItemAt_NavigationCalled() {
        let mockData = [UsersModel(id: 1, name: "Ahmet", username: "Ahmet", email: "ahmet@sevenapps.com", address: nil, phone: nil, website: nil, company: nil)]
        viewModel.userModel = mockData

        viewModel.didSelectItemAt(at: IndexPath(row: 0, section: 0))

        XCTAssertTrue(mockView.navigationPushCalled, "navigationPush should be called with UserDetailViewController")
    }
}
