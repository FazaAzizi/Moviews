//
//  HomeProtocol.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

protocol PTVHomeProtocol: AnyObject{

}

protocol VTPHomeProtocol: AnyObject{
    var view: PTVHomeProtocol? {get set}
    var interactor: PTIHomeProtocol? {get set}
    var router: PTRHomeProtocol? {get set}
}

protocol PTIHomeProtocol: AnyObject{
    var presenter:ITPHomeProtocol? {get set}
}

protocol ITPHomeProtocol: AnyObject{
    
}

protocol PTRHomeProtocol: AnyObject{
    static func createModuleHome()-> HomeVC
}
