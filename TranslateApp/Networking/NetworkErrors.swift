//
//  NetworkErrors.swift
//  TranslateApp
//
//  Created by Maryna Bolotska on 08/04/24.
//

import Foundation

enum NetworkErrors: Error {
    case transportError(Error) // Ошибка транспорта, например, отсутствие интернета
    case serverError(statusCode: Int) // Ошибка сервера с указанием HTTP статуса
    case noData // Данные не получены
    case decodingError(Error) // Ошибка декодирования данных
    case serverError(statusCode: Int, message: String?) // Ошибка сервера с дополнительным сообщением
    case unexpectedError
    case apiError(ApiError) // Ошибка API с дополнительными данными
}

struct ApiError: Codable {
    let status: String
    let code: String?
    let message: String?
}
