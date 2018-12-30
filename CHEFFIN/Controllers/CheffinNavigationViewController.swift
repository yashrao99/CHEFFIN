//
//  CheffinNavigationViewController.swift
//  CHEFFIN
//
//  Created by Yash Rao on 12/29/18.
//  Copyright © 2018 Yash Rao. All rights reserved.
//

import UIKit

class CheffinNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func pushTo(viewController: VIEWCONRTOLLER, meta: Any?) {
        let currentVC = self.topViewController

        switch viewController {
        case .RECIPERESULTS:
            if !(currentVC is RecipeResultsViewController) {
                if let recipes = meta as? [Recipe] {
                    self.pushToRecipeResults(recipes: recipes)
                }
            }
        }
    }

    func pushToRecipeResults(recipes: [Recipe]?) {
        let recipeResultsVC = RecipeResultsViewController()
        recipeResultsVC.recipes = recipes
        self.pushViewController(recipeResultsVC, animated: true)
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
