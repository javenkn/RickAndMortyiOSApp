//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by J on 2/5/23.
//

import UIKit

/// Configurable controller to search
class RMSearchViewController: UIViewController {
    /// Configuration for search session
    struct Config {
        enum FilterType {
            case character // name | status | gender
            case episode // name
            case location // name | planet
            
            var title: String {
                switch self {
                case .character:
                    return "Search Character"
                case .episode:
                    return "Search Episode"
                case .location:
                    return "Search Location"
                }
            }
        }
        
        let filterType: FilterType
    }
    
    private let config: Config
    
    // MARK: - Init
    
    init(config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = config.filterType.title
        view.backgroundColor = .systemBackground
    }
}
