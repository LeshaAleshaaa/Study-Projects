//
//  ViewController.swift
//  WKWebView
//
//  Created by Алексей Смицкий on 18.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit
import WebKit

// MARK: - FirstViewController

final class FirstViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var webView = WKWebView()
    private lazy var tool = UIToolbar()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addViews()
        layout()
    }
    
    // MARK: - Private methods
    
    private func layout() {
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.webViewTopAncor),
            webView.widthAnchor.constraint(
                equalTo: view.widthAnchor),
            webView.heightAnchor.constraint(
                equalTo: view.heightAnchor)])
        
        tool.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tool.topAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: Constants.toolTopAncor),
            tool.centerXAnchor.constraint(
                equalTo: webView.centerXAnchor),
            tool.widthAnchor.constraint(
                equalTo: view.widthAnchor),
            tool.heightAnchor.constraint(
                equalToConstant: Constants.toolHeightAncor)])
    }
    
    // MARK: - Selectors
    
    @objc
    private func reload() {
        webView.reload()
    }
    
    @objc
    private func nextPage() {
        if webView.canGoForward{
            webView.goForward()
        }
    }
    
    @objc
    private func lastPage() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc
    private func share() {
        if let url = webView.url {
            let activityController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            present(activityController, animated: true, completion: nil)
        }
    }
}

// MARK: - Setups

private extension FirstViewController {
    
    func setupViews() {
        setWebView()
        setToolBar()
        setNaviButton()
    }
    
    func setWebView () {
        if let url = Constants.webViewURL {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    func setToolBar() {
        tool.setItems(
            [UIBarButtonItem(
                barButtonSystemItem: .rewind,
                target: self,
                action: #selector(lastPage)),
             UIBarButtonItem(
                barButtonSystemItem: .fastForward,
                target: self,
                action: #selector(nextPage)),
             UIBarButtonItem(
                barButtonSystemItem: .action,
                target: self,
                action: #selector(share))],
            animated: true)
    }
    
    func setNaviButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(reload))
    }
}

// MARK: - Setup Elements

private extension FirstViewController {
    
    func addViews() {
        view.addSubview(webView)
        view.addSubview(tool)
    }
}

// MARK: - Constants

private extension FirstViewController {
    
    enum Constants {
        static let webViewTopAncor: CGFloat = 65
        static let webViewURL = URL(string: "https://www.google.com")
        
        static let toolTopAncor: CGFloat = -100
        static let toolHeightAncor: CGFloat = 50
    }
}
