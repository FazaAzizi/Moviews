//
//  SearchPageVC.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import UIKit

class SearchPageVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: VTPSearchPageProtocol?
    var dataGenres: [GenreModel]?
    var filter: [GenreModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.startFetchGenres()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func setupView(){
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.isScrollEnabled = true
        
        tableView.register(SearchPageCellTableViewCell.nib(), forCellReuseIdentifier: SearchPageCellTableViewCell.identifier)
        
        let dummyViewHeight = CGFloat(90)
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.size.width, height: dummyViewHeight))
        tableView.contentInset = UIEdgeInsets(top: -dummyViewHeight, left: 0, bottom: 0, right: 0)
    }
}

extension SearchPageVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filter?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchPageCellTableViewCell.identifier, for: indexPath) as! SearchPageCellTableViewCell
        
        cell.titleLbl.text = filter?[row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let navigation = self.navigationController{
            self.presenter?.goToListMovie(id: (filter?[indexPath.row].id!)!, nav: navigation, header: (filter?[indexPath.row].name ?? ""))
        }
    }
}

extension SearchPageVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            filter = dataGenres
        }else{
            if let data = dataGenres{
                filter = data.filter{$0.name!.lowercased().contains(searchText.lowercased())}
            }
        }
        self.tableView.reloadData()
    }
}

extension SearchPageVC: PTVSearchPageProtocol{
    func showFetchGenres(data: [GenreModel]) {
        self.dataGenres = data
        self.filter = dataGenres
        self.tableView.reloadData()
    }
    
    func showFailed(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
