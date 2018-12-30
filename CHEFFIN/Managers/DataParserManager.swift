//
//  DataParserManager.swift
//  CHEFFIN
//
//  Created by Yash Rao on 12/29/18.
//  Copyright © 2018 Yash Rao. All rights reserved.
//

import UIKit
import SwiftyJSON

class DataParserManager: NSObject {

    override init() {
        super.init()
    }

    class func extractRecipes(recipeJSON: JSON) -> [Recipe]? {
        var recipeResults = [Recipe]()
        if let highLim = recipeJSON["to"].int {
            let totalResults = highLim - recipeJSON["from"].int!
            for i in 0..<totalResults {
                let individualRecipe = recipeJSON["hits"][i]["recipe"]
                let recipe = Recipe.upsert(fullJSON: individualRecipe)
                recipeResults.append(recipe!)
            }
            return recipeResults
        }
        return nil
    }
}
