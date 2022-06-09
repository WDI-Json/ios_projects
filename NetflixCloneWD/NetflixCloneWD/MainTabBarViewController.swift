//
//  ViewController.swift
//  NetflixCloneWD
//
//  Created by Wouter on 31/05/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let homevc = UINavigationController(rootViewController: HomeViewController())
        let upcomingvc = UINavigationController(rootViewController: UpcomingViewController())
        let searchvc = UINavigationController(rootViewController: SearchViewController())
        let downloadsvc = UINavigationController(rootViewController: DownloadsViewController())
        
        homevc.tabBarItem.image = UIImage(systemName: "house")
        upcomingvc.tabBarItem.image = UIImage(systemName: "play.circle")
        searchvc.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        downloadsvc.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        homevc.title = "Home"
        upcomingvc.title = "Coming"
        searchvc.title = "Top Search"
        downloadsvc.title = "Downloads"
        tabBar.tintColor = .label
        setViewControllers([homevc, upcomingvc, searchvc, downloadsvc], animated: true)
    }
}

