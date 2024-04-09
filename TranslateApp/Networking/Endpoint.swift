//
//  Endpoint.swift
//  TranslateApp
//
//  Created by Maryna Bolotska on 08/04/24.
//

import Foundation

enum Endpoint {
//    case doSearch(request: String)
//    case doSearchMuscle(request: String)
//    case doSearchDiff(request: String)
    case doSearch(selection: String, destination: String, text: String)
    
    /// Возвращает путь конечной точки в зависимости от выбранного запроса.
    var path: String {
        switch self {
        case .doSearch:
            return "/translate"
        }
    }
}
