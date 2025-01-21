//
//  NavigationPerformable.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 20.01.2025.
//

import UIKit

protocol NavigationPerformable {
    func navigationPush(controller: UIViewController, animated: Bool)
    func navigationPop(animated: Bool)
    func navigationPopToRoot(animated:Bool)
}
extension NavigationPerformable where Self: UIViewController { // where Self is here because sometimes it is better to use for specific scope not an entire protocol. Also since i need to mockuserlistviewcontroller and conform userlistviewcontroller's protocol it is better using this way.
    private var errorMessage: String { // This is called computed property
        return "NavigationController does not found"
    }
    
    func navigationPush(controller: UIViewController, animated: Bool) {
        guard let navigationController = navigationController else {
            print(errorMessage)
            return
        }
        navigationController.pushViewController(controller, animated: animated)
    }
    
    func navigationPop(animated:Bool) {
        guard let navigationController = navigationController else {
            print(errorMessage)
            return
        }
        navigationController.popViewController(animated: animated)
    }
    
    func navigationPopToRoot(animated:Bool) {
        guard let navigationController = navigationController else {
            print(errorMessage)
            return
        }
        navigationController.popToRootViewController(animated: animated)
    }
}
