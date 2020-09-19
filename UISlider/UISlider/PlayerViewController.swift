//
//  PlayerViewController.swift
//  UISlider
//
//  Created by Алексей Смицкий on 22.07.2020.
//  Copyright © 2020 SmithCo. All rights reserved.
//

import UIKit
import AVFoundation

//MARK: PlayerViewController

final class PlayerViewController: UIViewController {
    
    //MARK: Propertys
    
    private lazy var nicknameLabel = UILabel()
    private lazy var musicPlayer = AVAudioPlayer()
    private lazy var volumeSlider = UISlider()
    private lazy var volumeLabel = UILabel()
    private lazy var playButton = UIButton()
    private lazy var pauseButton = UIButton()
    private lazy var infoButton = UIButton()
    private lazy var trackTimeLabel = UILabel()
    private lazy var timeOfTrack = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView()
    }
    
    //MARK: Loading View method
    
    private func loadingView() {
        
        //Добавление на экран
        view.addSubview(nicknameLabel)
        view.addSubview(volumeSlider)
        view.addSubview(playButton)
        view.addSubview(pauseButton)
        view.addSubview(infoButton)
        view.addSubview(trackTimeLabel)
        view.addSubview(timeOfTrack)
        view.addSubview(volumeLabel)
        
        //Выставление координат
        nicknameLabel.frame = CGRect(x: 20, y: 50, width: 400, height: 50)
        trackTimeLabel.frame = CGRect(x: 0, y: 150, width: 150, height: 50)
        trackTimeLabel.center.x = view.center.x
        volumeLabel.frame = CGRect(x: 0, y: 250, width: 100, height: 50)
        volumeLabel.center.x = view.center.x
        volumeSlider.frame = CGRect(x: 0, y: 300, width: 300, height: 50)
        volumeSlider.center.x = view.center.x
        playButton.frame = CGRect(x: 40, y: 450, width: 80, height: 80)
        pauseButton.frame = CGRect(x: 140, y: 450, width: 80, height: 80)
        infoButton.frame = CGRect(x: 240, y: 450, width: 80, height: 80)
        timeOfTrack.frame = CGRect(x: 0, y: 200, width: 300, height: 50)
        timeOfTrack.center.x = view.center.x
        
        //Присвоение вида и поведения
        view.backgroundColor = .lightGray
        volumeSlider.value = 100.0
        volumeLabel.text = "Громкость"
        trackTimeLabel.text = "Перемотка песни"
        
        playButton.setImage(UIImage(named: "playButtonImage.png"), for: .normal)
        pauseButton.setImage(UIImage(named: "pauseButtonImage.png"), for: .normal)
        infoButton.setImage(UIImage(named: "infoButtonImage.png"), for: .normal)
        
        //Селекторы
        playButton.addTarget(self, action: #selector(playMusic), for: .touchDown)
        pauseButton.addTarget(self, action: #selector(pauseMusic), for: .touchDown)
        infoButton.addTarget(self, action: #selector(getTrackInfo), for: .touchDown)
        volumeSlider.addTarget(self, action: #selector(volume), for: .valueChanged)
        timeOfTrack.addTarget(self, action: #selector(trackTime), for: .valueChanged)
        
        //Проверка трека и задача поведения
        do {
            if let audioPath = Bundle.main.path(forResource: "The xx - Intro", ofType: "mp3") {
                
                try musicPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                timeOfTrack.maximumValue = Float(musicPlayer.duration)
            }
        } catch {
            nicknameLabel.text = "Нечего прослушивать :("
        }
    }
    
    //MARK: Connect with last view controller
    
    //Метод для отображения ника
    func pullSettings(nickname: String) {
        nicknameLabel.text = nickname + ", приятного прослушивания!"
    }
    
    //MARK: Selectors
    
    //Плей
    @objc
    func playMusic() {
        musicPlayer.play()
    }
    
    //Пауза
    @objc
    func pauseMusic() {
        musicPlayer.pause()
    }
    
    //Получение информации
    @objc
    func getTrackInfo() {
        let alertController = UIAlertController(title: "Название песни", message: "The xx - Intro", preferredStyle: .actionSheet)
        let doneButton = UIAlertAction(title: "Спасибо", style: .default) { (done) in
        }
        alertController.addAction(doneButton)
        present(alertController, animated: true, completion: nil )
    }
    
    //Громкость
    @objc
    func volume() {
        musicPlayer.volume = volumeSlider.value
    }
    
    //Время трека
    @objc
    func trackTime(slider: UISlider){
        if slider == timeOfTrack {
            musicPlayer.currentTime = TimeInterval(slider.value)
            musicPlayer.play()
        }
    }
}
