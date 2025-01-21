//
//  LoadingView.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 18.01.2025.
//

import UIKit

class LoadingView { // I don't use final keyword here because i may inherit LoadingView in the future while the project scales. e.g: class DarkModeLoadingView: LoadingView { }
    
    static let shared = LoadingView() // Used singleton to access LoadingView's methods. I did not use Dependency Injection because it is UI component and i dont need to test this class. If i want to test, singleton can be tested for UI.
    private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    private var backgroundView: UIView = UIView()
    
    private init() { // initilaized privately because i dont want other classes create instance of LoadingView again. e.g: let loadingViewinstanceInAnotherClass = LoadingView() (example of "ENCAPSULATION")
        configure()
    }
    
    func configure() {
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .large
        activityIndicator.color = .white
        activityIndicator.hidesWhenStopped = true
    }
    
    func startLoading() {
        guard let window = UIApplication.shared.keyWindow else {
            print("No detected window")
            return
        }

        print("Loading started")
        if !window.subviews.contains(backgroundView) {
            window.addSubview(backgroundView)
            NSLayoutConstraint.activate([
                backgroundView.leadingAnchor.constraint(equalTo: window.leadingAnchor),
                backgroundView.trailingAnchor.constraint(equalTo: window.trailingAnchor),
                backgroundView.topAnchor.constraint(equalTo: window.topAnchor),
                backgroundView.bottomAnchor.constraint(equalTo: window.bottomAnchor)
            ])
            
            backgroundView.addSubview(activityIndicator)
            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor)
            ])
        }
            self.activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            print("Loading stopped")
            self.activityIndicator.stopAnimating()
            self.backgroundView.removeFromSuperview()
        }
    }
}
