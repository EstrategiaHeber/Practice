//
//  RootPageViewController.swift
//  YoutubeClone
//
//  Created by HEBER JIMENEZ on 20/10/23.
//
// https://www.youtube.com/watch?v=63v0hOo-cbI&list=PLT_OObKZ3CpuEomHCc6v-49u3DFCdCyLH&index=8&ab_channel=VictorRoldanDev
// minuto 5


import UIKit

class RootPageViewController: UIPageViewController {
    
    var subViewControllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        // Cantidad de View Controllers deseados
        subViewControllers = [
            HomeViewController(),
            VideosViewController(),
            PlaylistsViewController(),
            ChannelsViewController(),
            AboutViewController()
        ]
        
        // Se le asigna el tag a cada ViewController
        
        for (element, offset) in subViewControllers {
            
        }
        _ = subViewControllers.enumerated().map( {$0.element.view.tag = $0.offset})
        
        // Cuando muestre la pantalla mostrara HomeViewController (posicion 0)
        setViewControllerFromIndex(index: 0, direction: .forward)
    }
    
    func setViewControllerFromIndex(index: Int, direction: NavigationDirection, animated: Bool = true) {
        setViewControllers([subViewControllers[index]], direction: direction, animated: animated)
    }
}

extension RootPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    // Vista anterior
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = subViewControllers.firstIndex(of: viewController) ?? 0
        
        if index <= 0 {
            return nil
        } else {
            return subViewControllers[index - 1]
        }
        
    }
    
    // Vista posterior
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let index = subViewControllers.firstIndex(of: viewController) ?? 0
        
        if index >= (subViewControllers.count - 1)  {
            return nil
        } else {
            return subViewControllers[index + 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print("finished: \(finished)")
    }
}
