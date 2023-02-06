//
//  RMEpisodeDetailView.swift
//  RickAndMorty
//
//  Created by J on 2/4/23.
//

import UIKit

final class RMEpisodeDetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemRed
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}
