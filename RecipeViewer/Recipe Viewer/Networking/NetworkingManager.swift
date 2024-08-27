//
//  NetworkingManager.swift
//  Recipe Viewer
//
//  Created by jae Lee on 8/20/24.
//

import Foundation
import UIKit
import MobileCoreServices
import Combine


enum NetworkingError:Error {
    case urlInvalid
    case invalidHttpResponse
    case statusCode(Int)
    case other(Error)
    
    
    static func map(_ error: Error) -> NetworkingError {
      return (error as? NetworkingError) ?? .other(error)
    }
}


class NetworkingManager {
    // Type alias
    typealias dataTaskSessionHandler = (Result<(Data,URLResponse),Error>) -> Void
    typealias networkingDataPublisher = AnyPublisher<Data, NetworkingError>
    
    // Instance
    static let sharedInstance = NetworkingManager()
    
    // NSUrlSession properties
    let defaultSession:URLSession
    var dataTask: URLSessionDataTask?
    
    private init() {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 10.0
        sessionConfig.timeoutIntervalForResource = 10.0
        defaultSession = URLSession(configuration: sessionConfig)
    }
    
    public func GET(urlString: String, apiKey: String? = nil, idToken: String? = nil, completion: @escaping dataTaskSessionHandler) {
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        if let apiKey = apiKey {
            request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        }
        if let idToken = idToken {
            request.setValue(idToken, forHTTPHeaderField: "x-id-token")
        }
        
        
        defaultSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data , let response = response else {
                let error = NSError(domain: "Error with: \(urlString)", code: 0, userInfo: nil)
                completion(.failure(error))
                return
            }
            completion(.success((data,response)))
            
            }.resume()
    }
    
    //MARK: - Using Combine
    /** Reactive */
    public func GET(urlString: String, apiKey: String? = nil, idToken: String? = nil)  -> networkingDataPublisher {
        guard let url = URL(string: urlString) else {
            return Fail(error: NetworkingError.urlInvalid)
              .eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        if let apiKey = apiKey {
            request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        }
        if let idToken = idToken {
            request.setValue(idToken, forHTTPHeaderField: "x-id-token")
        }
        
        return defaultSession.dataTaskPublisher(for: request)
            // 2
            .tryMap { response in
                guard let httpURLResponse = response.response as? HTTPURLResponse else {
                    throw NetworkingError.invalidHttpResponse
                }
                
                guard httpURLResponse.statusCode == 200 else {
                    throw NetworkingError.statusCode(httpURLResponse.statusCode)
                }
                // 5
                return response.data
            }
            .mapError({NetworkingError.map($0)})
            .eraseToAnyPublisher()
        
    }
    
   
    
}




