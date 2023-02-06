//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by J on 2/5/23.
//

import UIKit

/// Configurable controller to search
class RMSearchViewController: UIViewController {

    struct Config {
        enum FilterType {
            case character
            case episode
            case location
        }
        
        let filterType: FilterType
    }
    
    private let config: Config
    
    init(config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        view.backgroundColor = .systemBackground
    }
}
