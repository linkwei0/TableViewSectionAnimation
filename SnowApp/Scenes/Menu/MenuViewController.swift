//
//  ViewController.swift
//  SnowApp
//
//  Created by Артём Бацанов on 06.12.2022.
//

import UIKit

class MenuViewController: UIViewController {
    // MARK: - Properties
    
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
        tableView.estimatedRowHeight = 60
        tableView.register(ResortCell.self, forCellReuseIdentifier: ResortCell.reuseIdentifier)
        tableView.register(MapCell.self, forCellReuseIdentifier: MapCell.reuseIdentifier)
        tableView.register(StatisticCell.self, forCellReuseIdentifier: StatisticCell.reuseIdentifier)
        tableView.frame = view.bounds
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
                cell.configure(with: viewModel.testConfigure(indexPath: indexPath))
                return cell
            }
        case .map:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MapCell.reuseIdentifier,
                                                        for: indexPath) as? MapCell {
                return cell
            }
        case .resort(_):
            if let cell = tableView.dequeueReusableCell(withIdentifier: ResortCell.reuseIdentifier,
                                                        for: indexPath) as? ResortCell {
                cell.configure(with: viewModel.testConfigure(indexPath: indexPath))
                return cell
            }
        }
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.setHeightCellInSection(indexPath: indexPath)
    }
}
