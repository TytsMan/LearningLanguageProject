//
//  UITableViewCell+cellIdentifier.swift
//  LearningLanguageProject
//
//  Created by Ivan on 17/08/2022.
//

import Foundation
import UIKit

protocol IdentifiableCell {
    
    static var cellIdentifier: String { get }
    
}

extension UITableViewCell: IdentifiableCell {
    
    static var cellIdentifier: String { return String(describing: self) }
    
}
