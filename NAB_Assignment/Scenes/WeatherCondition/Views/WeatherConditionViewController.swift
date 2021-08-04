//
//  WeatherConditionViewController.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/3/21.
//

import UIKit
import RxSwift
import RxCocoa

class WeatherConditionViewController: ViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configUI() {
        self.title = "Weather Forecast"
        self.setupSearchBar()
        
        let identifier: String = WeatherConditionTableViewCell.reuseID
        self.tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        self.tableView.tableHeaderView = UIView()
        self.tableView.tableFooterView = UIView()
    }
    
    override func bindViewModel() {
        guard let viewModel = viewModel as? WeatherConditionViewModel else { return }
        let input = WeatherConditionViewModel.Input(keywordTrigger: searchBar.rx.text.orEmpty.asDriver())
        
        let output = viewModel.transform(input: input)
        output.items.drive(tableView.rx.items(cellIdentifier: WeatherConditionTableViewCell.reuseID, cellType: WeatherConditionTableViewCell.self)) { tv, viewModelItem, cell in
            cell.bind(viewModel: viewModelItem)
            cell.selectionStyle = .none
        }.disposed(by: disposeBag)
        
        viewModel.loading.drive(onNext: {[weak self] isLoading in
            guard let weakSelf = self else { return }
            weakSelf.loadingView.isHidden = !isLoading
        }).disposed(by: disposeBag)
    }
    
    private func setupSearchBar() {
        self.searchBar.placeholder = "Enter city name"
        searchBar.rx.textDidBeginEditing.asObservable().subscribe(onNext: { [weak self] () in
            self?.searchBar.setShowsCancelButton(true, animated: true)
        }).disposed(by: disposeBag)

        searchBar.rx.textDidEndEditing.asObservable().subscribe(onNext: { [weak self] () in
            self?.searchBar.setShowsCancelButton(false, animated: true)
        }).disposed(by: disposeBag)

        searchBar.rx.cancelButtonClicked.asObservable().subscribe(onNext: { [weak self] () in
            self?.searchBar.resignFirstResponder()
        }).disposed(by: disposeBag)

        searchBar.rx.searchButtonClicked.asObservable().subscribe(onNext: { [weak self] () in
            self?.searchBar.resignFirstResponder()
        }).disposed(by: disposeBag)
    }
}
