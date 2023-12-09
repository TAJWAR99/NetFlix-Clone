//
//  ViewController.swift
//  Netflix_Clone
//
//  Created by Sihan on 15/11/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemCyan
        
        var vc1 = UINavigationController(rootViewController: HomeViewController())
        var vc2 = UINavigationController(rootViewController: UpcomingViewController())
        var vc3 = UINavigationController(rootViewController: SearchViewController())
        var vc4 = UINavigationController(rootViewController: DownloadViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        vc1.title = "Home"
        vc2.title = "Coming soon"
        vc3.title = "Top Search"
        vc4.title = "Downloads"
        
        //Add the click effect on the icons
        tabBar.tintColor = .label
        
        //To show the tab bar items
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        
    }


}

