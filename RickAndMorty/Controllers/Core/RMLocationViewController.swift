//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by J on 1/29/23.
//

import UIKit

/// Controller to show and search for locations
final class RMLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Locations"
        addSearchButton()
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    
    @objc
    private func didTapSearch() {
        
    }
}
