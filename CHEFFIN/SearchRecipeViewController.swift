//
//  SearchRecipeViewController.swift
//  CHEFFIN
//
//  Created by Yash Rao on 12/25/18.
//  Copyright © 2018 Yash Rao. All rights reserved.
//

import UIKit

class SearchRecipeViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
    }

    @objc func searchButtonPressed() {
        var searchParams = self.generateSearchParameters(query: self.searchTextField.text, specific_return: nil, from: 0, to: 10, ingredient_count: nil)
        searchParams = NetworkManager.generateAPIParameters(api: .RECIPE, parameters: &searchParams)
        let searchURL = NetworkManager.buildURL(api: .RECIPE, parameters: searchParams)
        NetworkManager.standardGETRequest(url: searchURL) { (success, json) in
            if success {
                //DO SOMETHING WITH JSON HERE
                if let highLim = json!["to"].int {
                    let totalResults = highLim - json!["from"].int!
                    for i in 0..<totalResults {
                        let fullRecipe = json!["hits"][i]
                        print("YASH LOOK HERE", json!["hits"][i])
                    }

                }
            }
        }
    }


    // This function generates the parameters to build the proper URL for the search query. There are additional parameters I will add later, this is just proof-of-concept for time-being.

    func generateSearchParameters(query: String?, specific_return: String?, from: Int?, to: Int?, ingredient_count: Int?) -> [String:String] {
        var parameters = [String:String]()
        parameters[RECIPE_SEARCH_PARAMS.q.rawValue] = query!
        if specific_return != nil {
            parameters[RECIPE_SEARCH_PARAMS.r.rawValue] = specific_return
        }
        if from != nil {
            parameters[RECIPE_SEARCH_PARAMS.from.rawValue] = "\(from!)"
        }
        if to != nil {
            parameters[RECIPE_SEARCH_PARAMS.to.rawValue] = "\(to!)"
        }
        return parameters
    }

}
