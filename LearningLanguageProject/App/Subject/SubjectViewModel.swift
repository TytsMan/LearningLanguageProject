//
//  SubjectViewModel.swift
//  LearningLanguageProject
//
//  Created Ivan on 16/08/2022.

import Foundation
import Combine

enum SubjectViewModelError: Error, Equatable {
    case customError
}

enum SubjectViewModelState: Equatable {
    case list
    case loading
    case error(SubjectViewModelError)
}

class SubjectViewModel {
    
    enum Section { case subjects }
    
    private var subscriptions: [AnyCancellable] = []
    
    private weak var coordinator: SubjectCoordinator?
    private let dataProvider: SubjectProviderProtocol
    
    @Published private(set) var subjects: [Subject] = []
    @Published private(set) var state: SubjectViewModelState = .loading

    init(
        coordinator: SubjectCoordinator,
        dataProvider: SubjectProviderProtocol
    ) {
        self.coordinator = coordinator
        self.dataProvider = dataProvider
    }
    
    func fetchData() {
        
        let receiveCompletion:((Subscribers.Completion<Error>) -> Void) = { [weak self] completion in
            switch completion {
            case .failure(_):
                self?.state = .error(.customError)
            case .finished:
                self?.state = .list
            }
        }
        
        let receiveValue: (([Subject]) -> Void) = { [weak self] subjects in
            self?.subjects = subjects
        }
        
        dataProvider
            .fetchAllData()
            .sink(
                receiveCompletion: receiveCompletion,
                receiveValue: receiveValue
            ).store(in: &subscriptions)
        
    }
    
    func didReceiveUISelect(subject: Subject) {
        coordinator?.open(subject: subject)
    }
}
