//
//  SubjectCoordinator.swift
//  LearningLanguageProject
//
//  Created by Ivan on 16/08/2022.
//

import UIKit

class SubjectCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(
        parentCoordinator: Coordinator,
        navigationController: UINavigationController
    ) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = SubjectViewModel(
            coordinator: self,
            dataProvider: SubjectProvider.shared
        )
        let viewController = SubjectView(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func open(subject: Subject) {
        // navigate to lesson
    }
}
