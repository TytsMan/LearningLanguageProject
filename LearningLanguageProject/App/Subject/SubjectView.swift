//
//  SubjectView.swift
//  LearningLanguageProject
//
//  Created Ivan on 16/08/2022.
//

import UIKit
import Combine

class SubjectView: UIViewController {
    
    private typealias DataSource = UITableViewDiffableDataSource<SubjectViewModel.Section, Subject>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<SubjectViewModel.Section, Subject>
    
    private var subscriptions: [AnyCancellable] = []
    
    private lazy var contentView = SubjectUI()
    private var viewModel : SubjectViewModel
    
    private var dataSource: DataSource!
    
    init(viewModel: SubjectViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
    }
    
    override func loadView() {
        view = contentView
    }
    
    // MARK: - Setup
    
    private func setupTableView() {
        contentView.tableView.register(
            SubjectCell.self,
            forCellReuseIdentifier: SubjectCell.cellIdentifier
        )
        contentView.tableView.delegate = self
    }
    
    private func setupBindings() {
        viewModel
            .$subjects
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.updateDataSource()
            }.store(in: &subscriptions)
        
        let stateValueHandler: (SubjectViewModelState) -> Void = { [weak self] state in
            switch state {
            case let .error(error):
                self?.showError(error)
            case .list:
                self?.contentView.stopLoading()
            case .loading:
                self?.contentView.startLoading()
            }
        }
        
        viewModel
            .$state
            .receive(on: RunLoop.main)
            .sink(receiveValue: stateValueHandler)
            .store(in: &subscriptions)
    }
    
    private func updateDataSource() {
        var snapshot = Snapshot()
        snapshot.appendSections([.subjects])
        snapshot.appendItems(viewModel.subjects)
        dataSource.apply(snapshot)
    }
    
    private func showError(_ error: Error) {
        /// show error
    }
}

// MARK: - UICollectionViewDataSource

extension SubjectView {
    
    private func configureDataSource() {
        dataSource = DataSource(
            tableView: contentView.tableView
        ) { tableView, indexPath, subject in
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: UITableViewCell.cellIdentifier,
                for: indexPath
            ) as? SubjectCell
            
            cell?.update(
                with: subject,
                rightImage: UIImage(named: "house")!
            )
            
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension SubjectView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didReceiveUISelect(subject: viewModel.subjects[indexPath.row])
    }
}
