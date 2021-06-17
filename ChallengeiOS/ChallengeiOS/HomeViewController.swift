//
//  HomeViewController.swift
//  ChallengeiOS
//
//  Created by Carlos Garcia on 16/06/2021.
//

import UIKit

protocol HomeViewProtocol {
    func showError(string:String)
    func getPaymentsData()
    func hideSpinner()
}

final class HomeViewController: UIViewController {
    
    let tableView = UITableView()
    let activityIndicatorView = UIActivityIndicatorView(style: .large)

    var presenter : HomeViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter = HomeViewPresenter.init(view: self)
        setupViews()
        presenter.getAPIPaymentsData()
    }
    
    private func setupViews(){
        view.addSubview(tableView)
        self.title = "Payment methods"
        view.backgroundColor = .white
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        //tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.showsVerticalScrollIndicator = true
        let topConstraintTable = tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30.0 )
        let bottomConstraintTable = tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30.0)
        let leadingConstraintTable = tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15.0)
        let trailingConstraintTable = tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15.0)
        NSLayoutConstraint.activate([topConstraintTable, bottomConstraintTable, leadingConstraintTable, trailingConstraintTable])
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.startAnimating()
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.activityIndicatorView.startAnimating()
        self.getPaymentsData()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension HomeViewController : HomeViewProtocol {
    func hideSpinner() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicatorView.stopAnimating()
        }
    }
    
    func showError(string:String) {
        DispatchQueue.main.async { [weak self] in
            let alertController = UIAlertController(title: self?.title, message: string, preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alertController.addAction(OKAction)
            self?.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    func getPaymentsData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.backgroundView?.isHidden = true
            self?.tableView.isScrollEnabled = true
            self?.tableView.reloadData()
        }
    }
    
    
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getPaymentsCount()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        presenter.configureCell(cell, indexPath.row)
        return cell
    }
}

