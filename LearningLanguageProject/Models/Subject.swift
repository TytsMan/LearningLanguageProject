//
//  Subject.swift
//  LearningLanguageProject
//
//  Created Ivan on 16/08/2022.
//

import Foundation

struct Subject {

    let id: UUID
    let name: String
    let cover: URL?
    let words: [Word]
}

extension Subject: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    static func == (lhs: Subject, rhs: Subject) -> Bool {
        return lhs.id == rhs.id
    }
}
