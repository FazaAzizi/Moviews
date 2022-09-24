//
//  HomeVC.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import UIKit

class HomeVC: UIViewController {
    
    var presenter: VTPHomeProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupView(){
        
    }
    


}

extension HomeVC: PTVHomeProtocol{
    
}
