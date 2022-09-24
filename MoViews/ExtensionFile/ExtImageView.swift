//
//  ExtImageView.swift
//  MoViews
//
//  Created by Faza Azizi on 19/09/22.
//

import Foundation
import UIKit

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
//        DispatchQueue.global().async {[weak self] in
//            if let imageData = try? Data(contentsOf: url) {
//                if let loadedImage = UIImage(data: imageData) {
//                    DispatchQueue.main.async {
//                        self?.image = loadedImage
//                    }
//                }
//            }
//        }
        
        let activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        self.addSubview(activityView)
        activityView.frame = self.bounds
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activityView.startAnimating()
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                activityView.stopAnimating()
                activityView.removeFromSuperview()
            }
            
             if let data = data {
                 let image = UIImage(data: data)
                 DispatchQueue.main.async {
                     self.image = image
                 }
             }
         }.resume()
        
//        DispatchQueue.main.async { [weak self] in
//            if let imageData = try? Data(contentsOf: url) {
//                if let loadedImage = UIImage(data: imageData) {
//                        self?.image = loadedImage
//                }
//            }
//        }
    }
}
