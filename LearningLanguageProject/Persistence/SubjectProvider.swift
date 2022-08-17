//
//  SubjectProvider.swift
//  LearningLanguageProject
//
//  Created by Ivan on 16/08/2022.
//

import Foundation
import Combine

protocol SubjectProviderProtocol {
    func fetchAllData() -> AnyPublisher<[Subject], Error>
}

class SubjectProvider: SubjectProviderProtocol {
    
    static let shared = SubjectProvider()
    
    private init() {}
    
    func fetchAllData() -> AnyPublisher<[Subject], Error> {
        let data = [
            Subject(id: UUID(), name: "Subject1", cover: nil, words: []),
            Subject(id: UUID(), name: "Subject2", cover: nil, words: []),
            Subject(id: UUID(), name: "Subject3", cover: nil, words: []),
            Subject(id: UUID(), name: "Subject4", cover: nil, words: []),
            Subject(id: UUID(), name: "Subject5", cover: nil, words: [])
        ]
        return Just(data)
            .delay(for: 0.3, scheduler: RunLoop.main)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
}
