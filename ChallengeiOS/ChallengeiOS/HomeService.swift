//
//  PaymentsService.swift
//  ChallengeiOS
//
//  Created Carlos Garcia on 16/06/2021.
//  Copyright © 2021 Carlos Garcia. All rights reserved.
//

import UIKit
typealias PaymentsResponse = (Result<Payments, Error>) -> ()


protocol HomeServiceProtocol {
    func getPaymentsJSON(completion: @escaping PaymentsResponse)
}

final class HomeService {
    
    private let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
    
    private func fetch(request: URLRequest, completionHandler:@escaping PaymentsResponse) {
        
        let dataTask = defaultSession.dataTask(with: request) {(data, response, error) in
            
            guard let _ = response else {
                let error = NSError(domain: "", code: -1, userInfo: [ NSLocalizedDescriptionKey: StringErrors.noConnection])
                completionHandler(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = NSError(domain: "", code: -1, userInfo: [ NSLocalizedDescriptionKey: StringErrors.invalidServerType])
                completionHandler(.failure(error))
                return
            }
            
            let statusCode = httpResponse.statusCode
            
            guard statusCode == 200 else {
                let error = NSError(domain: "", code:statusCode, userInfo: [ NSLocalizedDescriptionKey: StringErrors.invalidServerType])
                completionHandler(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "", code:statusCode, userInfo: [ NSLocalizedDescriptionKey: StringErrors.emptyData])
                completionHandler(.failure(error))
                return
            }
            
            do {
                
                guard let payments = try? JSONDecoder().decode(Payments.self, from: data) else {
                    let error = NSError(domain: "", code:statusCode, userInfo: [ NSLocalizedDescriptionKey: StringErrors.parsingError])
                    completionHandler(.failure(error))
                    return
                }
                
                completionHandler(.success(payments))
                
            }
            
        }
        
        dataTask.resume()
    }
	
}

extension HomeService: HomeServiceProtocol {
    
    func getPaymentsJSON(completion: @escaping PaymentsResponse) {
        let requestURLString = "https://raw.githubusercontent.com/optile/checkout-android/develop/shared-test/lists/listresult.json"
        
        
        guard let requestURL = URL(string: requestURLString) else {
            let error = NSError(domain: "", code:-1, userInfo: [ NSLocalizedDescriptionKey: StringErrors.urlError])
            completion(.failure(error))
                
            return
        }
        
        let request = URLRequest(url: requestURL)
        
        self.fetch(request: request, completionHandler: completion)
    }
    
}
