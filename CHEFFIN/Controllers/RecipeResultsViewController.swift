//
//  RecipeResultsViewController.swift
//  CHEFFIN
//
//  Created by Yash Rao on 12/29/18.
//  Copyright © 2018 Yash Rao. All rights reserved.
//

import UIKit

class RecipeResultsViewController: UIViewController {

    var cheffNav: CheffinNavigationViewController!
    var recipes: [Recipe]?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.cheffNav = self.navigationController as? CheffinNavigationViewController
        self.cheffNav.parent?.title = "Results"
        print("AY RECIPES", recipes)
        // Do any additional setup after loading the view.
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
