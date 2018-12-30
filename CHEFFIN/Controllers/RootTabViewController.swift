//
//  RootTabViewController.swift
//  CHEFFIN
//
//  Created by Yash Rao on 12/29/18.
//  Copyright © 2018 Yash Rao. All rights reserved.
//

import UIKit

class RootTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTabBarVC()

        // Do any additional setup after loading the view.
    }

    func configureTabBarVC() {
        let searchVC = SearchRecipeViewController()
        searchVC.title = "Search for Recipe!"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let viewControllerList = [searchVC]
        self.viewControllers = viewControllerList.map { CheffinNavigationViewController(rootViewController: $0)}
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
