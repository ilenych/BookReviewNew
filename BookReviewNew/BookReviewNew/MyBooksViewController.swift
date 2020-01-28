//
//  ViewController.swift
//  BookReviewNew
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import UIKit
import SnapKit

class MyBooksViewController: UIViewController {
    //MARK: - Variable
    private var bgView = BackgroundView(title: "My Book list", buttonIsHidden: true)
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.tintColor = #colorLiteral(red: 0.2209328711, green: 0.3112437129, blue: 0.4919691086, alpha: 1)
        searchBar.barTintColor = .white
        
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        
        textFieldInsideSearchBar?.textColor = #colorLiteral(red: 0.2209328711, green: 0.3112437129, blue: 0.4919691086, alpha: 1)
        textFieldInsideSearchBar?.backgroundColor = #colorLiteral(red: 0.9366608262, green: 0.9168593287, blue: 0.9258540869, alpha: 1)
        
        searchBar.layer.shadowColor = #colorLiteral(red: 0.2209328711, green: 0.3112437129, blue: 0.4919691086, alpha: 1).cgColor
        searchBar.layer.shadowRadius = 4
        searchBar.layer.shadowOpacity = 0.2
        searchBar.layer.shadowOffset = CGSize(width: 8, height: 8)
        searchBar.layer.cornerRadius = 8
        
        return searchBar
    }()
    
    private lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.backgroundColor = .clear
        tb.separatorStyle = .none
        tb.delegate = self
        tb.dataSource = self
        return tb
    }()
    
    private lazy var button: MainButton = {
        let b = MainButton(title: "ADD BOOK REVIEW")
        b.frame = CGRect(x: 0, y: 0, width: view.frame.width - 64, height: 50)
        b.setGradientLayer()
        return b
    }()
    
    private var books = [Books]()
    private var searchBook = [Books]()
    private var searching = false
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup view
        view.backgroundColor = #colorLiteral(red: 0.9584549069, green: 0.9517697692, blue: 1, alpha: 1)
        
        // Setups
        setupBackgroundView()
        setupSearchBar()
        setupTableView()
        setupButton()
            
        // TableView
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: TableViewCell.reuseId)
        
        // Local Service
        LocalService.fethData { (books) in
            self.books = books
        }
    }
    
    //MARK: - Setups
    fileprivate func setupBackgroundView() {
        view.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(175)
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(view.snp.top)
        }
    }
    
    fileprivate func setupSearchBar() {
        bgView.addSubview(searchBar)
        searchBar.snp.makeConstraints { (make) in
            make.leading.equalTo(view.snp.leading).offset(32)
            make.trailing.equalTo(view.snp.trailing).offset(-32)
            make.height.equalTo(48)
            make.centerX.equalTo(bgView.snp.centerX)
            make.bottom.equalTo(bgView.snp.bottom)
        }
    }
    
    fileprivate func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.width.equalTo(view.snp.width)
            make.top.equalTo(bgView.snp.bottom).offset(12)
            make.bottom.equalTo(view.snp.bottomMargin)
        }
    }
    
    fileprivate func setupButton() {
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.leading.equalTo(view.snp.leading).offset(32)
            make.trailing.equalTo(view.snp.trailing).offset(-32)
            make.height.equalTo(50)
            make.bottom.equalTo(view.snp.bottomMargin).offset(-20)
        }
    }
}
//MARK: - UITableViewDelegate, UITableViewDataSource

extension MyBooksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchBook.count
        }
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as! TableViewCell
        
        let book = searching ? searchBook[indexPath.row] : books[indexPath.row]
        
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.nameLabel.text = book.name
        cell.categoryLabel.text = book.category
        cell.coverBookImageView.image = UIImage(named: book.image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let descriptionBookViewController: DescriptionBookViewController = DescriptionBookViewController()
        
        let book = searching ? searchBook[indexPath.row] : books[indexPath.row]
        
        descriptionBookViewController.book = book
        
        descriptionBookViewController.modalTransitionStyle = .coverVertical
        descriptionBookViewController.modalPresentationStyle = .overCurrentContext
        self.present(descriptionBookViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 150
      }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
}
//MARK: - UISearchBarDelegate

extension MyBooksViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBook = books.filter({$0.name.lowercased().prefix(searchText.count) == searchText.lowercased()})
        
        searchBar.showsCancelButton = true
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = nil
        searchBar.resignFirstResponder()
        searching = false
        
        tableView.reloadData()
    }
}

