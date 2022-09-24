//
//  ListReviewVC.swift
//  MoViews
//
//  Created by Faza Azizi on 24/09/22.
//

import UIKit
import Foundation
import Kingfisher

class ListReviewVC: UIViewController {
    
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: VTPListReviewProtocol?
    
    var id: Int?
    var dataReview: [ReviewModel] = []
    var page = 1
    var totalPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let id = id {
            self.presenter?.startFetchReviewById(id: id, page: page)
        }
        setupView()
    }
    
    func setupView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.isScrollEnabled = true
        tableView.register(ListReviewCell.nib(), forCellReuseIdentifier: ListReviewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        
        let dummyViewHeight = CGFloat(90)
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.size.width, height: dummyViewHeight))
        tableView.contentInset = UIEdgeInsets(top: -dummyViewHeight, left: 0, bottom: 0, right: 0)
    }
}

extension ListReviewVC:  UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataReview.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListReviewCell.identifier, for: indexPath) as! ListReviewCell
        
        if let img = dataReview[row].author_details.avatar_path{
            let url = URL(string: "https://image.tmdb.org/t/p/original\(img)")
            cell.imageAva.kf.setImage(with: url)
        }
        
        cell.lblName.text = dataReview[row].author
        cell.lblRating.text = dataReview[row].author_details.rating
        cell.lblCreatedDate.text = dataReview[row].created_at
        cell.lblContent.text = dataReview[row].content
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height

        if maximumOffset - currentOffset <= 10.0 {
            if page != totalPage{
                page += 1
                self.presenter?.startFetchReviewById(id: id!, page: page)
            }
        }
    }
}

extension ListReviewVC: PTVListReviewProtocol{
    func showFetchReviewById(data: [ReviewModel], totalPage: Int) {
        if page == 1 {
            self.dataReview = data
        }else{
            dataReview.append(contentsOf: data)
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
