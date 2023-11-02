//
//  HomeViewController.swift
//  YoutubeClone
//
//  Created by HEBER JIMENEZ on 20/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var controller = HomeController(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            await controller.getHomeObjects()
        }
    }

}

extension HomeViewController: HomeViewProtocol {
    func getData(list: [[Any]]) {
        print("List: \(list)")
    }
}
