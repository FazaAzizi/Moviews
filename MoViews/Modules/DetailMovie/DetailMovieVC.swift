//
//  DetailMovieVC.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import UIKit
import Alamofire
import Kingfisher

class DetailMovieVC: UIViewController {
    
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imgBackdrop: UIImageView!
    @IBOutlet weak var imgPoster: UIImageView!
    
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblDurasi: UILabel!
    @IBOutlet weak var lblSutradara: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblVote: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var btnReview: UIButton!
    @IBOutlet weak var btnTrailer: UIButton!
    
    var presenter: VTPDetailMovieProtocol?
    var id: Int?
    var dataMovie: DetailMovieModel?
    var genreNew = ""
    var sutradara = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        if let id = id {
            self.presenter?.startFetchDetailMovie(id: id, nav: self.navigationController!)
        }
        setupView()
    }
    
    func setupView(){
        btnReview.addTarget(self, action: #selector(showReview), for: .touchUpInside)
    }
    
    func mapValue(){
        lblHeader.text = "Detail Movie"
        lblTitle.text = dataMovie?.title
        lblDurasi.text = "Duration : " + String(dataMovie?.runtime ?? 0)
        lblRating.text = "Rate : " + String(dataMovie?.vote_average ?? 0)
        lblVote.text = "Vote : " + String(dataMovie?.vote_count ?? 0)
        lblOverview.text = dataMovie?.overview
        
        for i in 0..<(dataMovie?.genre.count ?? 0){
            if i == 0{
                genreNew = dataMovie?.genre[i].name ?? ""
            }else{
                genreNew = genreNew + ", " + (dataMovie?.genre[i].name ?? "")
            }
        }
        
        for i in 0..<(dataMovie?.productionCompanie.count ?? 0){
            if i == 0{
                sutradara = dataMovie?.productionCompanie[i].name ?? ""
            }else{
                sutradara = sutradara + ", " + (dataMovie?.productionCompanie[i].name ?? "")
            }
        }

        if let img = dataMovie?.backdrop_path{
            let url = URL(string: "https://image.tmdb.org/t/p/original\(img)")
            imgBackdrop.kf.setImage(with: url)
        }
        
        if let img = dataMovie?.poster_path{
            let url = URL(string: "https://image.tmdb.org/t/p/original\(img)")
            imgPoster.kf.setImage(with: url)
        }
        
        lblSutradara.text = sutradara
        lblGenre.text = genreNew
    }
    
    @objc func showReview(){
        if let navigation = self.navigationController{
            self.presenter?.gotoListReviewPage(id: dataMovie?.id ?? 0, nav: navigation)
        }
    }

}

extension DetailMovieVC: PTVDetailMovieProtocol{
    func showDetailMovie(data: DetailMovieModel, nav: UINavigationController) {
        self.dataMovie = data
        self.mapValue()
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
