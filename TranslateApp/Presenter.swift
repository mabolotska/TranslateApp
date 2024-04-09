//
//  Presenter.swift
//  TranslateApp
//
//  Created by Maryna Bolotska on 08/04/24.
//

import Foundation
import UIKit

protocol PresenterProtocol: AnyObject {
    var langPickerNumber: Int { get }
    func getLanguage(at index: Int) -> String
    
}

class Presenter: PresenterProtocol {
    let userDefaultsManager = UserDefaultsManager()
    
    weak var viewController: ViewController?
//    var langArray: [Language] = Language.allCases
    var langArray = Array(Language.dictionary.values)
//    var selectedLanguage: String?
//    var destLanguage: String?
        lazy var selectedLanguage = languageCode[0]
        lazy var destLanguage = langArray[0]
    var languageCode = Array(Language.dictionary.keys)
    
    
    init(viewController: ViewController? = nil) {
        self.viewController = viewController
        langArray[0] = userDefaultsManager.restoreLanguage(forKey: .favoriteLanguage) ?? "italian"

    }
    var langPickerNumber: Int {
        return langArray.count
    }
//    
//    func getLanguage(at index: Int) -> Language {
//     //   return langArray[index]
////        let languageCode = Array(Language.dictionary.keys)[index]
////         let languageName = Array(Language.dictionary.values)[index]
//         return Language(code: languageCode[index], name: languageName[index])
//    }
    func getLanguage(at index: Int) -> String {
        return langArray[index]
    }

    
    func didSelectRow(row: Int, forSourceLanguage: Bool) {
        if forSourceLanguage {
            selectedLanguage = langArray[row]
            userDefaultsManager.set(selectedLanguage, forKey: .favoriteLanguage)
        } else {
            destLanguage = languageCode[row]
            userDefaultsManager.set(destLanguage, forKey: .destinationLanguage)
        }
    }

    func doTranslate(endpoint: Endpoint) {
        NetworkManager.shared.fetchData(for: endpoint) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.viewController?.displayText(text: data.destinationText ?? "no text")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error)
                }
            }
        }
    }
    
    func playSourceSound(endpoint: Endpoint) {
        NetworkManager.shared.fetchData(for: endpoint) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.viewController?.soundURL(url: data.pronunciation?.sourceTextAudio ?? "no audio") 
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error)
                }
            }
        }
    }
    
    func playDestSound(endpoint: Endpoint) {
        NetworkManager.shared.fetchData(for: endpoint) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
            //        self.viewController?.displayText(text: data.destinationText ?? "no text")
                    self.viewController?.soundURL(url: data.pronunciation?.destinationTextAudio ?? "no audio")
          
                   
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error)
                }
            }
        }
    }
}
