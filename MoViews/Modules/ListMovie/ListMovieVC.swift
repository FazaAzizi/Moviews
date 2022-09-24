//
//  ListMovieVC.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import UIKit
import Foundation
import Kingfisher

class ListMovieVC: UIViewController {
    
    @IBOutlet weak var toolbarLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: VTPListMovieProtocol?
    var listMoview: [ListMovieModel] = []
    var page = 1
    var header: String = ""
    var id: Int?
    var totalPage = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        if let id = id {
            self.presenter?.startFetchMoviewById(id: id, page: page)
        }
        setupView()
    }
    
    func setupView(){
        toolbarLbl.text = header
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.isScrollEnabled = true
        tableView.register(ListMovieCell.nib(), forCellReuseIdentifier: ListMovieCell.identifier)
        
        let dummyViewHeight = CGFloat(90)
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.size.width, height: dummyViewHeight))
        tableView.contentInset = UIEdgeInsets(top: -dummyViewHeight, left: 0, bottom: 0, right: 0)
    }

}

extension ListMovieVC:  UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMoview.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListMovieCell.identifier, for: indexPath) as! ListMovieCell
        
        cell.titleLbl.text = listMoview[row].title
        if let img = listMoview[row].backdropPath{
            let url = URL(string: "https://image.tmdb.org/t/p/original\(img)")
            cell.posterImg.kf.indicatorType = .activity
            cell.posterImg.kf.setImage(with: url)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 275
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let navigation = self.navigationController{
            self.presenter?.gotoDetailPage(id: listMoview[indexPath.row].id ?? 0, nav: navigation)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height

        if maximumOffset - currentOffset <= 10.0 {
            if page != totalPage{
                page += 1
                self.presenter?.startFetchMoviewById(id: self.id!, page: page)
            }
        }
    }
}

extension ListMovieVC: PTVListMovieProtocol{
    func showFetchMovieById(data: [ListMovieModel], totalPage: Int) {
        if page == 1 {
            self.listMoview = data
        }else{
            listMoview.append(contentsOf: data)
        }
        
        self.totalPage = totalPage
        self.tableView.reloadData()
    }
    
    func showFailed(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
