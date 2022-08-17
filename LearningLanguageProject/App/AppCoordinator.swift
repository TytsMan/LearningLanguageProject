//
//  AppCoordinator.swift
//  LearningLanguageProject
//
//  Created by Ivan on 16/08/2022.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(
        navigationController : UINavigationController
    ) {
        self.navigationController = navigationController
    }
    
    func start() {
        let subjectCoordinator = SubjectCoordinator(
            parentCoordinator: self,
            navigationController: navigationController
        )
        subjectCoordinator.start()
        children.append(subjectCoordinator)
    }
}
