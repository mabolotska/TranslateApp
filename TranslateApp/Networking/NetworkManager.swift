//
//  NetworkManager.swift
//  TranslateApp
//
//  Created by Maryna Bolotska on 08/04/24.
//

import Foundation

struct NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    

    private func createURL(for endPoint: Endpoint, with query: String? = nil) -> URL? {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = endPoint.path

        switch endPoint {
        case .doSearch(selection: let selection, destination: let destination, text: let text):
            components.queryItems = [
                URLQueryItem(name: "sl", value: selection),
                URLQueryItem(name: "dl", value: destination),
                URLQueryItem(name: "text", value: text)
            ]
        }

        return components.url
    }

    
    private func makeRequest<T: Codable>(for url: URL, completion: @escaping(Result<T, Error>) -> Void) {
        let request = URLRequest(url: url)
//        request.setValue(API.apiKey, forHTTPHeaderField: "X-Api-Key")
        print("URL: \(url.absoluteString)")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 400, userInfo: nil)))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

 

    func fetchData(for endpoint: Endpoint, completion: @escaping(Result<Trans, Error>) -> Void) {
        guard let url = createURL(for: endpoint) else {
            completion(.failure(NSError(domain: "", code: 400, userInfo: nil))) 
            return
        }
        
        makeRequest(for: url, completion: completion)
    }

}
