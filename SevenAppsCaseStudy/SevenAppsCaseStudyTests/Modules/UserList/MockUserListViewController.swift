//
//  MockUserListViewController.swift
//  SevenAppsCaseStudyTests
//
//  Created by Ahmet Yasin Atakan on 21.01.2025.
//

import UIKit

#if DEVELOPMENT
@testable import SevenAppsCaseStudyDev
#elseif PRODUCTION
@testable import SevenAppsCaseStudyProd
#endif

final class MockUserListViewController: UserListViewControllerProtocol {
    var invokedPrepareTableView = false
    var invokedPrepareTableViewCount = 0
    var invokedReloadData = false
    var invokedReloadDataCount = 0
    var navigationPushCalled = false
    var navigationPopCalled = false
    var navigationPopToRoot = false
    
    func navigationPush(controller: UIViewController, animated: Bool) {
        navigationPushCalled = true
    }
    
    func navigationPop(animated: Bool) {
        navigationPopCalled = true
    }
    
    func navigationPopToRoot(animated: Bool) {
        navigationPopToRoot = true
    }
    
    func prepareTableView() {
        invokedPrepareTableView = true
        invokedPrepareTableViewCount += 1
    }
    
    func reloadData() {
        invokedReloadData = true
        invokedReloadDataCount += 1
    }
    
    
}
