//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by J on 1/30/23.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}
