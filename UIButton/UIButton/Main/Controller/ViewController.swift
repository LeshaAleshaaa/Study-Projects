//
//  ViewController.swift
//  UIButton
//
//  Created by Алексей Смицкий on 11.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit

// MARK: - ViewController

final class ViewController: UIViewController {
    
    // MARK: - Public properties
    
    private lazy var screenNameLabel = UILabel()
    private lazy var timeLabel = UILabel()
    private lazy var startButton = UIButton()
    private lazy var pauseButton = UIButton()
    private lazy var stopButton = UIButton()
    private lazy var timer = Timer()
    private lazy var miliSec = 0
    private lazy var second = 0
    private lazy var minute = 0
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addViews()
        addActions()
        layout()
    }
    
    // MARK: - Private methods
    
    private func layout() {
        
        screenNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            screenNameLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.screenNameLabelTopAcnor),
            screenNameLabel.widthAnchor.constraint(
                equalToConstant: Constants.screenNameLabelWidthAncor),
            screenNameLabel.heightAnchor.constraint(
                equalToConstant: Constants.screenNameLabelHeightAncor),
            screenNameLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(
                equalTo: screenNameLabel.bottomAnchor,
                constant: Constants.timeLabelTopAncor),
            timeLabel.centerXAnchor.constraint(
                equalTo: screenNameLabel.centerXAnchor),
            timeLabel.widthAnchor.constraint(
                equalToConstant: Constants.timeLabelWidthAncor),
            timeLabel.heightAnchor.constraint(
                equalToConstant: Constants.timeLabelHeightAncor)])
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(
                equalTo: timeLabel.bottomAnchor,
                constant: Constants.startButtonTopAncor),
            startButton.widthAnchor.constraint(
                equalToConstant: Constants.startButtonWidthAcnor),
            startButton.heightAnchor.constraint(
                equalToConstant: Constants.startButtonHeightAncor),
            startButton.leadingAnchor.constraint(
                equalTo: timeLabel.leadingAnchor)])
        
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pauseButton.centerYAnchor.constraint(
                equalTo: startButton.centerYAnchor),
            pauseButton.trailingAnchor.constraint(
                equalTo: timeLabel.trailingAnchor),
            pauseButton.widthAnchor.constraint(
                equalToConstant: Constants.pauseButtonWidthAncor),
            pauseButton.heightAnchor.constraint(
                equalToConstant: Constants.pauseButtonHeightAncor)])
        
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stopButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(
                equalTo: startButton.bottomAnchor,
                constant: Constants.stopButtonTopAncor),
            stopButton.widthAnchor.constraint(
                equalToConstant: Constants.stopButtonWidthAncor),
            stopButton.heightAnchor.constraint(
                equalToConstant: Constants.stopButtonHeightAncor)])
    }
    
    // MARK: - Selectors
    
    @objc
    private func timerscore() {
        
        switch (minute, second, miliSec) {
        case (_, _, 0...998):
            miliSec += 1
            timeLabel.text = "\(minute) min \(second).\(miliSec) sec"
            
        case (_, 0...58, 999):
            miliSec = 0
            second += 1
            miliSec += 1
            
        case (0...58, _, _):
            second = 0
            miliSec = 0
            miliSec += 1
            minute += 1
            
        default:
            break
        }
    }
    
    @objc
    private func timerCounting(button: UIButton) {
        
        switch button {
        case startButton:
            timer = Timer.scheduledTimer(timeInterval: 1/1000, target: self, selector: #selector(timerscore), userInfo: nil, repeats: true)
            startButton.isEnabled = false
            
        case pauseButton:
            timer.invalidate()
            startButton.isEnabled = true
            
        case stopButton:
            second = 0
            miliSec = 0
            minute = 0
            timer.invalidate()
            timeLabel.text = Constants.timeLabelText
            startButton.isEnabled = true
        default:
            break
        }
    }
}

// MARK: - Setups

private extension ViewController {
    
    func setupView() {
        setScreenNameLabel()
        setTimeLabel()
        setStartButton()
        setPauseButton()
        setStopButton()
    }
    
    func setScreenNameLabel() {
        screenNameLabel.text = Constants.screenNameLabelText
        screenNameLabel.font = Constants.screenNameLabelFont
        screenNameLabel.contentMode = .center
    }
    
    func setTimeLabel() {
        timeLabel.text = Constants.timeLabelText
        timeLabel.font = Constants.timeLabelFont
        timeLabel.contentMode = .center
    }
    
    func setStartButton() {
        startButton.setImage(Constants.startButtonImage, for: .normal)
    }
    
    func setPauseButton() {
        pauseButton.setImage(Constants.pauseButtonImage, for: .normal)
    }
    
    func setStopButton() {
        stopButton.setImage(Constants.stopButtonImage, for: .normal)
    }
}

// MARK: - Setup Elements

private extension ViewController {
    
    func addViews() {
        view.addSubview(screenNameLabel)
        view.addSubview(timeLabel)
        view.addSubview(startButton)
        view.addSubview(pauseButton)
        view.addSubview(stopButton)
    }
    
    func addActions() {
        startButton.addTarget(self, action: #selector(timerCounting), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(timerCounting), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(timerCounting), for: .touchUpInside)
    }
}

// MARK: - Constants

private extension ViewController {
    
    enum Constants {
        
        static let screenNameLabelTopAcnor: CGFloat = 20
        static let screenNameLabelWidthAncor: CGFloat = 200
        static let screenNameLabelHeightAncor: CGFloat = 50
        static let screenNameLabelText: String = "Секундомер"
        static let screenNameLabelFont: UIFont = .boldSystemFont(ofSize: 25)
        
        static let timeLabelTopAncor: CGFloat = 50
        static let timeLabelWidthAncor: CGFloat = 200
        static let timeLabelHeightAncor: CGFloat = 50
        static let timeLabelText: String = "0 min 0.0 sec"
        static let timeLabelFont: UIFont = .boldSystemFont(ofSize: 20)
        
        static let startButtonTopAncor: CGFloat = 50
        static let startButtonWidthAcnor: CGFloat = 70
        static let startButtonHeightAncor: CGFloat = 70
        static let startButtonImage = UIImage(named: "playButtonImage")
        
        static let pauseButtonWidthAncor: CGFloat = 70
        static let pauseButtonHeightAncor: CGFloat = 70
        static let pauseButtonImage = UIImage(named: "pauseButtonImage")
        
        static let stopButtonTopAncor: CGFloat = 20
        static let stopButtonWidthAncor: CGFloat = 70
        static let stopButtonHeightAncor: CGFloat = 70
        static let stopButtonImage = UIImage(named: "stopButtonImage")
    }
}
