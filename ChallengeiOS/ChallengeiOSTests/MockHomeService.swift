//
//  MockHomeService.swift
//  ChallengeiOSTests
//
//  Created by Carlos Garcia on 17/06/2021.
//  Copyright © 2021 Carlos Garcia. All rights reserved.
//
import Foundation
@testable import ChallengeiOS

class MockHomeService: HomeServiceProtocol {
    
    var currentResult: Result<Payments, Error> = .failure(NSError.init())

    static let paymentsMock = try! JSONDecoder().decode(Payments.self, from: getData())
    var resultSuccess : Result<Payments, Error> = .success(MockHomeService.paymentsMock)
    var resultError : Result<Payments, Error> = .failure(NSError.init(domain: "", code: -1, userInfo: nil))
    
    func getPaymentsJSON(completion: @escaping PaymentsResponse) {
        completion(currentResult)
    }
    
    static func getData(name: String = "payments" , withExtension: String = "json") -> Data {
        let bundle = Bundle.init(for: MockHomeService.self)
        let fileUrl = bundle.url(forResource: name, withExtension: withExtension)
        let data = try! Data(contentsOf: fileUrl!)
        return data
    }
    
}
