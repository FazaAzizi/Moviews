//
//  HomePresenter.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

class HomePresenter: VTPHomeProtocol{
    var view: PTVHomeProtocol?
    
    var interactor: PTIHomeProtocol?
    
    var router: PTRHomeProtocol?
    
    
}

extension HomePresenter: ITPHomeProtocol{
    
}
