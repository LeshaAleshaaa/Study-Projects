//
//  SecondViewController.swift
//  WKWebView
//
//  Created by Алексей Смицкий on 18.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit
import WebKit

// MARK: - SecondViewController

final class SecondViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var pdfReader = WKWebView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addViews()
        layout()
        
        var i = 0
        while i < 5 {
            i += 1
            print(i)
        }
    }
    
    // MARK: - Private methods
    
    private func layout() {
        
        pdfReader.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pdfReader.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.pdfTopAncor),
            pdfReader.widthAnchor.constraint(
                equalTo: view.widthAnchor),
            pdfReader.heightAnchor.constraint(
                equalTo: view.heightAnchor)])
    }
    
    // MARK: - Selectors
    
    @objc
    private func share() {
        if let file = pdfReader.url {
            let activityController = UIActivityViewController(activityItems: [file], applicationActivities: nil)
            present(activityController, animated: true, completion: nil)
        }
    }
}

// MARK: - Setups

private extension SecondViewController {
    
    func setupViews() {
        setPDFReader()
        setNaviBar()
    }
    
    func setPDFReader() {
        
        if let reader = Constants.pdfURL {
            let request = URLRequest(url: reader)
            pdfReader.load(request)
        }
    }
    
    func setNaviBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(share))
    }
}

// MARK: - Setup Elements

private extension SecondViewController {
    
    func addViews() {
        view.addSubview(pdfReader)
    }
}

// MARK: - Constants

private extension SecondViewController {
    
    enum Constants {
        static let pdfTopAncor: CGFloat = 65
        static let pdfURL = Bundle.main.url(forResource: "SomePDF", withExtension: "pdf")
    }
}

