//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by J on 1/29/23.
//

import UIKit

/// Controller to show and search for characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(
            endpoint: .character,
            queryParams: [URLQueryItem(name: "name", value: "rick"), URLQueryItem(name: "status", value: "alive")]
        )
        
        print(request.url!)
    }
}
