//
//  SubjectUI.swift
//  LearningLanguageProject
//
//  Created Ivan on 16/08/2022.

import UIKit
import SnapKit
import Combine


class SubjectUI : UIView {
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    lazy var activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)
    
    init() {
        super.init(frame: .zero)
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startLoading() {
        tableView.isUserInteractionEnabled = false
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
    }
    
    func stopLoading() {
        tableView.isUserInteractionEnabled = true
        activityIndicatorView.stopAnimating()
    }
    
}

// MARK: - Setup

extension SubjectUI {
    
    func addSubviews() {
        let subviews = [tableView, activityIndicatorView]
        
        subviews.forEach { view in
            addSubview(view)
        }
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        activityIndicatorView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(50)
        }
    }
}
