//
//  ViewController.swift
//  TranslateApp
//
//  Created by Maryna Bolotska on 08/04/24.
//

import UIKit
import SnapKit
import AVFoundation

protocol ViewControllerProtocol: AnyObject {
    func displayText(text: String)
    func soundURL(url: String)
}

class ViewController: UIViewController, ViewControllerProtocol, UITextViewDelegate {
    var presenter: Presenter!
    var audioPlayer: AVPlayer?
    let userDefaultsManager = UserDefaultsManager()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "speaker.wave.2.fill"), for: .normal)
        return button
    }()
    private let translatedPlayButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "speaker.zzz.fill"), for: .normal)
        return button
    }()
    private let enterTextView: UITextView = {
        let tv = UITextView()
        tv.layer.borderWidth = 2
        tv.layer.cornerRadius = 10
        return tv
    }()
    private let translationLabel = UILabel()
    private let transButton: UIButton = {
        let button = UIButton()
        button.setTitle("Translate", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        
        return button
    }()
    lazy var selectedPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    lazy var destinationPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        translationLabel.layer.borderWidth = 2
        translationLabel.layer.cornerRadius = 10
        setViews()
        setConstraints()
        presenter = Presenter(viewController: self)
        transButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        enterTextView.delegate = self
        playButton.addTarget(self, action: #selector(playTapped), for: .touchUpInside)
        translatedPlayButton.addTarget(self, action: #selector(transPlayTapped), for: .touchUpInside)
    }
    
    func soundURL(url: String) {
        let audioURLString = url
            guard let audioURL = URL(string: audioURLString) else {
                print("Invalid URL")
                return
            }
        let playerItem = AVPlayerItem(url: audioURL)

        // Initialize AVPlayer with AVPlayerItem
        audioPlayer = AVPlayer(playerItem: playerItem)

        // Start playing audio
        audioPlayer?.play()
    }
    
    @objc func playTapped() {
        presenter.playSourceSound(endpoint: Endpoint.doSearch(selection:presenter.selectedLanguage, destination:presenter.destLanguage, text: enterTextView.text))
    }
    @objc func transPlayTapped() {
        presenter.playDestSound(endpoint: Endpoint.doSearch(selection:presenter.selectedLanguage, destination:presenter.destLanguage, text: translationLabel.text ?? "no translation"))
    }
    @objc func buttonTapped() {
        UIView.animate(withDuration: 0.2, animations: {
                   self.transButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
               }) { (_) in
                   UIView.animate(withDuration: 0.2) {
                       self.transButton.transform = CGAffineTransform.identity
                   }
               }

        presenter.doTranslate(endpoint: Endpoint.doSearch(selection:presenter.selectedLanguage, destination:presenter.destLanguage, text: enterTextView.text))
    }
    
    func displayText(text: String) {
        translationLabel.text = text
    }

    func setViews() {
        [enterTextView, translationLabel, transButton, selectedPicker, destinationPicker, playButton, translatedPlayButton].forEach {view.addSubview($0)}
    }
    func setConstraints() {
        selectedPicker.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.height.equalTo(200)
            make.leading.equalToSuperview().offset(40)
        }
        enterTextView.snp.makeConstraints { make in
            make.top.equalTo(selectedPicker.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(150)
        }
        playButton.snp.makeConstraints { make in
            make.top.equalTo(enterTextView.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(40)
            make.height.equalTo(20)
        }
        transButton.snp.makeConstraints { make in
            make.top.equalTo(playButton.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(50)
            make.height.equalTo(40)
        }
        destinationPicker.snp.makeConstraints { make in
            make.top.equalTo(transButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(40)
            make.height.equalTo(100)
        }
        translationLabel.snp.makeConstraints { make in
            make.top.equalTo(destinationPicker.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(150)
        }
        translatedPlayButton.snp.makeConstraints { make in
            make.top.equalTo(translationLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(40)
            make.height.equalTo(20)
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case selectedPicker:
            return presenter.langPickerNumber
        case destinationPicker:
            return presenter.langPickerNumber
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case selectedPicker:
            return "\(presenter.getLanguage(at: row))"
        case destinationPicker:
            return "\(presenter.getLanguage(at: row))"
        default:
            return "----"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case selectedPicker:
            return presenter.didSelectRow(row: row, forSourceLanguage: true)
        case destinationPicker:
            return presenter.didSelectRow(row: row, forSourceLanguage: false)
        default:
            return
        }
    }
}
