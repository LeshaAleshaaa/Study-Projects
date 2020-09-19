//
//  ViewController.swift
//  UITableView
//
//  Created by Алексей Смицкий on 28.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - ViewController

final class ViewController: UIViewController {
    
    // MARK: - Public properties
    
    lazy var tableView = UITableView()
    lazy var identifier = "CellName"
    lazy var namesArray: [String] = ["Алексей Смицкий",
                                     "Анастасия Соколова",
                                     "Евгений Сычев",
                                     "Анна Сычева",
                                     "Кирилл Мальцев",
                                     "Артем Есичев"]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addViews()
        layout()
    }
    
    // MARK: - Private methods
    
    private func layout() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor)])
    }
    
    // MARK: - Selectors
    
    @objc
    private func addSomeBody() {
        addNewUser()
    }
    
    @objc
    private func editTable() {
        tableView.isEditing.toggle()
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Create TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let cellNamesArray = namesArray[indexPath.row]
        
        cell.textLabel?.text = cellNamesArray
        return cell
    }
    
    // MARK: - Deleting Elements
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            namesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: - Moving Elements
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        namesArray.insert(namesArray.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    // MARK: - Copying Elements
    
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) {
            print("copied")
            return true
        }
        return false
    }
    
    func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        if action == #selector(copy(_:)) {
            let copyingCell = tableView.cellForRow(at: indexPath)
            let pasteBoard = UIPasteboard.general
            pasteBoard.string = (copyingCell?.textLabel?.text ?? "")
        }
    }
}

// MARK: - Setups

private extension ViewController {
    
    func setupViews() {
        setTableView()
        setNavibar()
    }
    
    func setTableView() {
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setNavibar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addSomeBody))
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .edit,
            target: self,
            action: #selector(editTable))
    }
}

// MARK: - Setup Elements

private extension ViewController {
    
    func addViews() {
        view.addSubview(tableView)
    }
}
