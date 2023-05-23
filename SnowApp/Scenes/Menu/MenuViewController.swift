//
//  ViewController.swift
//  SnowApp
//
//  Created by Артём Бацанов on 06.12.2022.
//

import UIKit

class MenuViewController: UIViewController {
    // MARK: - Properties
    
    private var isCollapse: Bool = false
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    private let viewModel: MenuViewModel
    
    // MARK: - Init
    
    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindToViewModel()
        viewModel.viewIsReady()
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.estimatedRowHeight = 45
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ResortCell.self, forCellReuseIdentifier: ResortCell.reuseIdentifier)
        tableView.register(MapCell.self, forCellReuseIdentifier: MapCell.reuseIdentifier)
        tableView.register(StatisticCell.self, forCellReuseIdentifier: StatisticCell.reuseIdentifier)
        tableView.frame = view.bounds
    }
    
    // MARK: - Private methods
    
    private func bindToViewModel() {
        viewModel.onDidExpandMap = { [weak self] in
            self?.tableView.beginUpdates()
            self?.isCollapse.toggle()
            
            if self?.isCollapse == true {
                UIView.animate(withDuration: 2.0) {
                    self?.tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
                }
            } else {
                UIView.animate(withDuration: 2.0) {
                    self?.tableView.reloadRows(at: [IndexPath(row: 0, section: 1)], with: .automatic)
                }
            }
            self?.tableView.endUpdates()
        }
    }
}

// MARK: - UITableViewDataSource

extension MenuViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.menuSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = viewModel.menuSections[indexPath.section]
        
        switch section {
        case .statistic(_):
            if let cell = tableView.dequeueReusableCell(withIdentifier: StatisticCell.reuseIdentifier,
                                                        for: indexPath) as? StatisticCell {
                cell.configure(with: viewModel.createCellViewModel(indexPath: indexPath))
                return cell
            }
        case .map:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MapCell.reuseIdentifier,
                                                        for: indexPath) as? MapCell {
                cell.configure(with: viewModel.createCellViewModel(indexPath: indexPath))
                return cell
            }
        case .resort:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ResortCell.reuseIdentifier,
                                                        for: indexPath) as? ResortCell {
                cell.configure(with: viewModel.createCellViewModel(indexPath: indexPath))
                return cell
            }
        }
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isCollapse && indexPath.section == 1 {
            return view.frame.height * 0.65
        } else if isCollapse && indexPath.section == 0  {
            guard let cell = tableView.cellForRow(at: indexPath) else { return 0 }
            cell.contentView.alpha = 0
            return 0
        } else {
            tableView.cellForRow(at: indexPath)?.contentView.alpha = 1
            return indexPath.section == 1 ? 240 : 45
        }
    }
}
