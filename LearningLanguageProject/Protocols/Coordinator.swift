//
//  Coordinator.swift
//  LearningLanguageProject
//
//  Created by Ivan on 16/08/2022.
//

import UIKit

protocol Coordinator {
    
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    
    func start()
    
}
