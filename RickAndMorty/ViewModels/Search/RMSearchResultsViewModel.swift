//
//  RMSearchResultsViewModel.swift
//  RickAndMorty
//
//  Created by J on 3/2/23.
//

import Foundation

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
