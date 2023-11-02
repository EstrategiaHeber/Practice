//
//  MainViewController.swift
//  YoutubeClone
//
//  Created by HEBER JIMENEZ on 20/10/23.
//

import UIKit

class MainViewController: UIViewController {
    
    var rootPageViewController: RootPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RootPageViewController {
            
            destination.delegateRoot = self
            rootPageViewController = destination
        }
    }
}

extension MainViewController: RootPageProtocol {
    
    func currentPage(_ index: Int) {
        print("Current page: ", index)
    }
}
