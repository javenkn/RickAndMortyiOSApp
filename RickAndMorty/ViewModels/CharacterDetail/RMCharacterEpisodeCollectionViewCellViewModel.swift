//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by J on 2/3/23.
//

import Foundation

final class RMCharacterEpisodeCollectionViewCellViewModel {
    let episodeDataURL: URL?
    
    init(episodeDataURL: URL?) {
        self.episodeDataURL = episodeDataURL
    }
}
