//
//  SecondViewController.swift
//  UITextField
//
//  Created by Алексей Смицкий on 07.08.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit
import MapKit
import AVFoundation

// MARK: - SecondViewController

final class SecondViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var screenLabel = UILabel()
    private lazy var backButton = UIBarButtonItem()
    private lazy var firstTask = UILabel()
    private lazy var secondTask = UILabel()
    private lazy var firstTaskButton = UIButton()
    private lazy var secondTaskButton = UIButton()
    private lazy var segmentView = UISegmentedControl()
    private lazy var pickerView = UIPickerView()
    private lazy var volumeSlider = UISlider()
    private lazy var volumeLabel = UILabel()
    private lazy var playButton = UIButton()
    private lazy var pauseButton = UIButton()
    private lazy var player = AVAudioPlayer()
    private lazy var map = MKMapView()
    
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
        
        screenLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            screenLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.screenLabelTopAncor),
            screenLabel.heightAnchor.constraint(
                equalToConstant: Constants.screenLabelHeightAncor),
            screenLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        firstTask.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstTask.topAnchor.constraint(
                equalTo: screenLabel.bottomAnchor,
                constant: Constants.firstTaskTopAncor),
            firstTask.widthAnchor.constraint(
                equalToConstant: Constants.firstTaskWidthAncor),
            firstTask.heightAnchor.constraint(
                equalToConstant: Constants.firstTaskHeightAncor),
            firstTask.leadingAnchor.constraint(
                equalTo: view.leadingAnchor)])
        
        secondTask.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondTask.topAnchor.constraint(
                equalTo: firstTask.bottomAnchor,
                constant: Constants.secondTaskTopAncor),
            secondTask.widthAnchor.constraint(
                equalToConstant: Constants.secondTaskWidthAncor),
            secondTask.heightAnchor.constraint(
                equalToConstant: Constants.secondTaskHeightAncor),
            secondTask.leadingAnchor.constraint(
                equalTo: view.leadingAnchor)])
        
        firstTaskButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstTaskButton.topAnchor.constraint(
                equalTo: screenLabel.bottomAnchor,
                constant: Constants.firstTaskButtonTopAncor),
            firstTaskButton.widthAnchor.constraint(
                equalToConstant: Constants.firstTaskButtonWidthAncor),
            firstTaskButton.heightAnchor.constraint(
                equalToConstant: Constants.firstTaskButtonHeightAncor),
            firstTaskButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor)])
        
        secondTaskButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondTaskButton.topAnchor.constraint(
                equalTo: firstTaskButton.bottomAnchor,
                constant: Constants.secondTaskButtonTopAncor),
            secondTaskButton.widthAnchor.constraint(
                equalToConstant: Constants.secondTaskButtonWidthAncor),
            secondTaskButton.heightAnchor.constraint(
                equalToConstant: Constants.secondTaskButtonHeightAncor),
            secondTaskButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor)])
        
        segmentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            segmentView.topAnchor.constraint(
                equalTo: secondTaskButton.bottomAnchor,
                constant: Constants.segmentTopAncor),
            segmentView.widthAnchor.constraint(
                equalToConstant: Constants.segmentWidthAncor),
            segmentView.heightAnchor.constraint(
                equalToConstant: Constants.segmentHeightAncor),
            segmentView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(
                equalTo: segmentView.bottomAnchor,
                constant: Constants.pickerViewTopAncor),
            pickerView.widthAnchor.constraint(
                equalToConstant: Constants.pickerViewWidthAncor),
            pickerView.heightAnchor.constraint(
                equalToConstant: Constants.pickerVIewHeightAncor),
            pickerView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        volumeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            volumeLabel.topAnchor.constraint(
                equalTo: pickerView.bottomAnchor,
                constant: Constants.volumeLabelTopAncor),
            volumeLabel.heightAnchor.constraint(
                equalToConstant: Constants.volumeLabelHeightAncor),
            volumeLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        volumeSlider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            volumeSlider.topAnchor.constraint(
                equalTo: volumeLabel.bottomAnchor,
                constant: Constants.volumeSliderTopAncor),
            volumeSlider.widthAnchor.constraint(
                equalToConstant: Constants.volumeSliderWidthAncor),
            volumeSlider.heightAnchor.constraint(
                equalToConstant: Constants.volumeSliderHeightAncor),
            volumeSlider.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(
                equalTo: volumeSlider.bottomAnchor,
                constant: Constants.playButtonTopAncor),
            playButton.widthAnchor.constraint(
                equalToConstant: Constants.playButtonWidthAncor),
            playButton.heightAnchor.constraint(
                equalToConstant: Constants.playButtonHeightAncor),
            playButton.leadingAnchor.constraint(
                equalTo: volumeSlider.leadingAnchor,
                constant: Constants.playButtonLeadingAncor)])
        
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pauseButton.topAnchor.constraint(
                equalTo: volumeSlider.bottomAnchor,
                constant: Constants.pauseButtonTopAncor),
            pauseButton.widthAnchor.constraint(
                equalToConstant: Constants.pauseButtonWidthAncor),
            pauseButton.heightAnchor.constraint(
                equalToConstant: Constants.pauseButtonHeightAncor),
            pauseButton.trailingAnchor.constraint(
                equalTo: volumeSlider.trailingAnchor,
                constant: Constants.pauseButtonTrailingAncor)])
        
        map.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            map.topAnchor.constraint(
                equalTo: segmentView.bottomAnchor,
                constant: Constants.mapTopAncor),
            map.widthAnchor.constraint(
                equalToConstant: Constants.mapWidthAncor),
            map.heightAnchor.constraint(
                equalToConstant: Constants.mapHeightAncor),
            map.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)])
    }
    
    // MARK: - Selectors
    
    @objc
    private func segment() {
        if segmentView.selectedSegmentIndex == 1 {
            pickerView.isHidden = true
            volumeSlider.isHidden = true
            volumeLabel.isHidden = true
            playButton.isHidden = true
            pauseButton.isHidden = true
            map.isHidden = false
        } else {
            pickerView.isHidden = false
            volumeSlider.isHidden = false
            volumeLabel.isHidden = false
            playButton.isHidden = false
            pauseButton.isHidden = false
            map.isHidden = true
        }
    }
    
    @objc
    private func currentVolume() {
        player.volume = volumeSlider.value
    }
    
    @objc
    private func play() {
        player.play()
    }
    
    @objc
    private func pause() {
        player.pause()
    }
    
    @objc
    private func done(button: UIButton) {
        if button.imageView?.image == UIImage(named: "empty") {
            button.setImage(UIImage(named: "done"), for: .normal)
        } else {
            button.setImage(UIImage(named: "empty"), for: .normal)
        }
    }
}
// MARK: - Setups

private extension SecondViewController {
    
    func setupView() {
        setScreenLabel()
        setFirstTask()
        setSecondTask()
        setFirstTaskButton()
        setSecondTaskButton()
        setSegmentView()
        setPickerView()
        setVolumeSlider()
        setVolumeLabel()
        setPlayButton()
        setPauseButton()
        setMapView()
        setPlayer()
    }
    
    func setScreenLabel() {
        screenLabel.text = Constants.screenLabelText
        screenLabel.font = Constants.screenLabelFontSize
        screenLabel.textColor = Constants.screenLabelColor
        screenLabel.contentMode = .center
    }
    
    func setFirstTask() {
        firstTask.text = Constants.firstTaskText
        firstTask.textColor = Constants.firstTaskColor
        firstTask.font = Constants.firstTaskFontSize
    }
    
    func setSecondTask() {
        secondTask.text = Constants.secondTaskText
        secondTask.textColor = Constants.secondTaskColor
        secondTask.font = Constants.secondTaskFontSize
    }
    
    func setFirstTaskButton() {
        firstTaskButton.setImage(Constants.firstTaskButtonImage, for: .normal)
    }
    
    func setSecondTaskButton() {
        secondTaskButton.setImage(Constants.secondTaskButtonImage, for: .normal)
    }
    
    func setSegmentView() {
        let segmentValues = Constants.segmentValuesArray
        segmentView = UISegmentedControl(items: segmentValues)
        segmentView.backgroundColor = Constants.segmentColor
        segmentView.selectedSegmentIndex = 0
    }
    
    func setPickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.setValue(UIColor.lightGray, forKeyPath: "textColor")
    }
    
    func setVolumeSlider() {
        volumeSlider.value = 10
        volumeSlider.minimumValue = 0
        volumeSlider.maximumValue = 10
    }
    
    func setVolumeLabel() {
        volumeLabel.text = Constants.volumeLabelText
        volumeLabel.textColor = Constants.volumeLabelColor
        volumeLabel.contentMode = .center
        volumeLabel.font = Constants.volumeLabelFont
    }
    
    func setPlayButton() {
        playButton.setImage(Constants.playButtonImage, for: .normal)
    }
    
    func setPauseButton() {
        pauseButton.setImage(Constants.pauseButtonImage, for: .normal)
    }
    
    func setMapView() {
        map.isHidden = true
    }
    
    func setPlayer() {
        do {
            if let audio = Bundle.main.path(forResource: "The xx - Intro", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audio))
            }
        } catch {
            print("Error")
        }
        player.play()
    }
}

// MARK: - Setup Elements

private extension SecondViewController {
    
    func addViews() {
        view.addSubview(screenLabel)
        view.addSubview(firstTask)
        view.addSubview(secondTask)
        view.addSubview(firstTaskButton)
        view.addSubview(secondTaskButton)
        view.addSubview(segmentView)
        view.addSubview(pickerView)
        view.addSubview(volumeSlider)
        view.addSubview(volumeLabel)
        view.addSubview(playButton)
        view.addSubview(pauseButton)
        view.addSubview(map)
    }
    
    func addActions() {
        segmentView.addTarget(self, action: #selector(segment), for: .valueChanged)
        volumeSlider.addTarget(self, action: #selector(currentVolume), for: .valueChanged)
        playButton.addTarget(self, action: #selector(play), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(pause), for: .touchUpInside)
        firstTaskButton.addTarget(self, action: #selector(done(button:)), for: .touchUpInside)
        secondTaskButton.addTarget(self, action: #selector(done(button:)), for: .touchUpInside)
    }
}

// MARK: - PickerView Extensions

extension SecondViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Constants.pickerViewComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.pickerViewRows
    }
}

extension SecondViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch row {
        case 0:
            return Constants.pickerViewEmpty
        case 1:
            return Constants.pickerViewSongName
        default:
            return Constants.pickerViewEmpty
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        guard row == Constants.emptyRow else {
            presentAlert(withTitle: "Внимание", message: "Название песни: The xx - Intro")
            return
        }
    }
}
// MARK: - Constants

private extension SecondViewController {
    
    enum Constants {
        
        static let screenLabelTopAncor: CGFloat = 20
        static let screenLabelHeightAncor: CGFloat = 50
        static let screenLabelText: String = "Список дел и музыка"
        static let screenLabelFontSize: UIFont = .boldSystemFont(ofSize: 20)
        static let screenLabelColor: UIColor = .lightGray
        
        static let firstTaskTopAncor: CGFloat = 20
        static let firstTaskWidthAncor: CGFloat = 200
        static let firstTaskHeightAncor: CGFloat = 50
        static let firstTaskFontSize: UIFont = .boldSystemFont(ofSize: 20)
        static let firstTaskText: String = "Сходить в магазин"
        static let firstTaskColor: UIColor = .lightGray
        
        static let secondTaskTopAncor: CGFloat = 20
        static let secondTaskWidthAncor: CGFloat = 200
        static let secondTaskHeightAncor: CGFloat = 50
        static let secondTaskFontSize: UIFont = .boldSystemFont(ofSize: 20)
        static let secondTaskText: String = "Доехать до сервиса"
        static let secondTaskColor: UIColor = .lightGray
        
        static let firstTaskButtonTopAncor: CGFloat = 20
        static let firstTaskButtonWidthAncor: CGFloat = 50
        static let firstTaskButtonHeightAncor: CGFloat = 50
        static let firstTaskButtonImage = UIImage(named: "empty")
        
        static let secondTaskButtonTopAncor: CGFloat = 20
        static let secondTaskButtonWidthAncor: CGFloat = 50
        static let secondTaskButtonHeightAncor: CGFloat = 50
        static let secondTaskButtonImage = UIImage(named: "empty")
        
        static let segmentValuesArray: [String] = ["Плеер", "Карта"]
        static let segmentColor: UIColor = .lightGray
        static let segmentTopAncor: CGFloat = 20
        static let segmentWidthAncor: CGFloat = 200
        static let segmentHeightAncor: CGFloat = 30
        
        static let pickerViewTopAncor: CGFloat = 20
        static let pickerViewWidthAncor: CGFloat = 300
        static let pickerVIewHeightAncor: CGFloat = 80
        
        static let volumeLabelText: String = "Уроверь громкости"
        static let volumeLabelColor: UIColor = .lightGray
        static let volumeLabelFont: UIFont = .boldSystemFont(ofSize: 20)
        static let volumeLabelHeightAncor: CGFloat = 50
        static let volumeLabelTopAncor: CGFloat = 20
        
        static let volumeSliderTopAncor: CGFloat = 20
        static let volumeSliderWidthAncor: CGFloat = 200
        static let volumeSliderHeightAncor: CGFloat = 50
        
        static let playButtonImage = UIImage(named: "play")
        static let playButtonTopAncor: CGFloat = 20
        static let playButtonWidthAncor: CGFloat = 50
        static let playButtonHeightAncor: CGFloat = 50
        static let playButtonLeadingAncor: CGFloat = 20
        
        static let pauseButtonImage = UIImage(named: "pause")
        static let pauseButtonTopAncor: CGFloat = 20
        static let pauseButtonWidthAncor: CGFloat = 50
        static let pauseButtonHeightAncor: CGFloat = 50
        static let pauseButtonTrailingAncor: CGFloat = -20
        
        static let mapTopAncor: CGFloat = 50
        static let mapWidthAncor: CGFloat = 300
        static let mapHeightAncor: CGFloat = 300
        
        static let pickerViewRows: Int = 2
        static let pickerViewComponents: Int = 1
        static let pickerViewEmpty: String = "Не выбрано"
        static let pickerViewSongName: String = "Название песни"
        static let songRow: Int = 1
        static let emptyRow: Int = 0
    }
}
