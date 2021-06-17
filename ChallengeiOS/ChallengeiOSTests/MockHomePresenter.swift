//
//  MockHomePresenter.swift
//  ChallengeiOSTests
//
//  Created by Carlos Garcia on 17/06/2021.
//  Copyright © 2021 Carlos Garcia. All rights reserved.
//

import Foundation
import UIKit
@testable import ChallengeiOS


final class MockHomePresenter : HomeViewPresenterProtocol {
    var payments : Payments?
    let service = MockHomeService()

    func getAPIPaymentsData() {
        self.service.getPaymentsJSON { [weak self] (result: Result<Payments, Error>) in
            switch result {
            case .success(let payments):
                self?.payments = payments
                break
            case .failure( _):
                break
            }
        }
    }
    
    func getPaymentsCount() -> Int {
        return payments?.networks.applicable.count ?? 0
    }
    
    func configureCell(_ cell: UITableViewCell, _ index: Int) {
        
    }
    
    
}
