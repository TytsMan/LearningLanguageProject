//
//  Word.swift
//  LearningLanguageProject
//
//  Created by Ivan on 16/08/2022.
//

import Foundation

class Word {
        
    let id: UUID
    let word: String
    let image: URL?
    let sound: URL?
    let translation: Word
    
    init(
        id: UUID,
        word: String,
        image: URL?,
        sound: URL?,
        translation: Word
    ) {
        self.id = id
        self.word = word
        self.image = image
        self.sound = sound
        self.translation = translation
    }

}
