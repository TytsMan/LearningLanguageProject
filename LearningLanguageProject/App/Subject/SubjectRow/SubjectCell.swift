//
//  SubjectCell.swift
//  LearningLanguageProject
//
//  Created by Ivan on 17/08/2022.
//

import UIKit

class SubjectCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    lazy var coverView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var rightIcon: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private func setupUIElements() {
        
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerView.addSubview(coverView)
        coverView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().inset(16)
            make.top.bottom.greaterThanOrEqualToSuperview().inset(16)
            make.width.height.equalTo(48)
        }
        
        containerView.addSubview(rightIcon)
        rightIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.right.equalToSuperview().inset(16)
            make.width.height.equalTo(24)
        }
        
        let textStackView = UIStackView(arrangedSubviews: [
            titleLabel,
            subtitleLabel
        ])
        textStackView.axis = .vertical
        textStackView.spacing = 4
        
        containerView.addSubview(textStackView)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.bottom.greaterThanOrEqualToSuperview().inset(16)
            make.left.equalTo(coverView.snp.right).inset(16)
            make.right.equalTo(rightIcon.snp.left).inset(16)
        }
    }
    
    func update(with subject: Subject, rightImage: UIImage) {
        titleLabel.text = subject.name
        subtitleLabel.text = NSLocalizedString("\(subject.words.count) items", comment: "")
        rightIcon.image = rightImage
    }
}
