//
//  HomeViewPresenter.swift
//  ChallengeiOS
//
//  Created by Carlos Garcia on 16/06/2021.
//  Copyright © 2021 Carlos Garcia. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewPresenterProtocol {
    func getAPIPaymentsData()
    func getPaymentsCount() -> Int
    func configureCell(_ cell: UITableViewCell, _ index: Int)
}

class HomeViewPresenter {

    var view: HomeViewProtocol?
    var service: HomeServiceProtocol!
    private var payments : Payments?


    convenience init(service: HomeServiceProtocol = HomeService(), view: HomeViewProtocol?) {
        self.init()
        self.view = view
        self.service = service
        
    }
}

extension  HomeViewPresenter : HomeViewPresenterProtocol {
    
    func configureCell(_ cell: UITableViewCell, _ index: Int) {
        let item = payments?.networks.applicable[index]
        cell.textLabel?.text = item?.label
    }
    
    func getPaymentsCount() -> Int {
        return payments?.networks.applicable.count ?? 0
    }
    
    func getAPIPaymentsData() {
        
        self.service.getPaymentsJSON { [weak self] (result: Result<Payments, Error>) in
            self?.view?.hideSpinner()
            switch result {
            case .success(let payments):
                self?.payments = payments
                self?.view?.getPaymentsData()
                break
            case .failure(let error):
                self?.view?.showError(string: error.localizedDescription)
                break
            }
        }
    }
    

}
