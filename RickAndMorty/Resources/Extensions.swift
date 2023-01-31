//
//  Extensions.swift
//  RickAndMorty
//
//  Created by J on 1/30/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
