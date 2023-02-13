//
//  RMLocationDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by J on 2/12/23.
//

import Foundation

protocol RMLocationDetailViewViewModelDelegate: AnyObject {
    func didFetchLocationDetails()
}

final class RMLocationDetailViewViewModel {
    private let endpointURL: URL?
    private var dataTuple: (location: RMLocation, characters: [RMCharacter])? {
        didSet {
            createCellViewModels()
            delegate?.didFetchLocationDetails()
        }
    }
    
    enum SectionType {
        case information(viewModels: [RMEpisodeInfoCollectionViewCellViewModel])
        case characters(viewModels: [RMCharacterCollectionViewCellViewModel])
    }
    
    public weak var delegate: RMLocationDetailViewViewModelDelegate?
    
    public private(set) var cellViewModels: [SectionType] = []
    
    // MARK: - Init
    
    init(endpointURL: URL?) {
        self.endpointURL = endpointURL
    }
    
    // MARK: - Public
    
    public func character(at index: Int) -> RMCharacter? {
        guard let dataTuple = dataTuple else {
            return nil
        }
        return dataTuple.characters[index]
    }
    
    // MARK: - Private
    
    private func createCellViewModels() {
        guard let dataTuple = dataTuple else {
            return
        }
        
        let location = dataTuple.location
        let characters = dataTuple.characters
        
        var createdString = location.created
        if let date = RMCharacterInfoCollectionViewCellViewModel.dateFormatter.date(
            from: location.created
        ) {
            createdString = RMCharacterInfoCollectionViewCellViewModel.shortDateFormatter.string(
                from: date
            )
        }
        
        cellViewModels = [
            .information(viewModels: [
                .init(title: "Location name", value: location.name),
                .init(title: "Type", value: location.type),
                .init(title: "Dimension", value: location.dimension),
                .init(title: "Created", value: createdString),
            ]),
            .characters(viewModels: characters.compactMap({ character in
                return RMCharacterCollectionViewCellViewModel(
                characterName: character.name,
                characterStatus: character.status,
                characterImageURL: URL(string: character.image))
            }))
        ]
    }
    
    /// Fetch backing location model
    public func fetchLocationData() {
        guard let url = endpointURL, let request = RMRequest(url: url) else {
            return
        }
        
        RMService.shared.execute(request, expecting: RMLocation.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.fetchRelatedCharacters(location: model)
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
    
    private func fetchRelatedCharacters(location: RMLocation) {
        let requests: [RMRequest] = location.residents
            .compactMap({ return URL(string: $0) })
            .compactMap({ return RMRequest(url: $0) })
     
        let group = DispatchGroup()
        var characters: [RMCharacter] = []
        for request in requests {
            group.enter()
            RMService.shared.execute(request, expecting: RMCharacter.self) { result in
                defer {
                    group.leave()
                }
                switch result {
                case .success(let model):
                    characters.append(model)
                case .failure:
                    break
                }
            }
        }
        
        group.notify(queue: .main) {
            self.dataTuple = (
                location: location,
                characters: characters
            )
        }
    }
}
