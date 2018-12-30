//
//  Recipe+CRUD.swift
//  CHEFFIN
//
//  Created by Yash Rao on 12/26/18.
//  Copyright © 2018 Yash Rao. All rights reserved.
//

import Foundation
import MagicalRecord
import SwiftyJSON

extension Recipe {

    class func upsert(fullJSON: JSON) -> Recipe? {
        if let title = fullJSON["label"].string,
            let source = fullJSON["source"].string,
            let calories = fullJSON["calories"].double {
            let ingredients = fullJSON["ingredientLines"].arrayObject as? [String]
            let imageURL = fullJSON["image"].string
            let yield = fullJSON["yield"].double
            let totalDailyNutrients = try? JSONSerialization.data(withJSONObject: fullJSON["totalDaily"].object, options: .sortedKeys)
            let digestiveInfo = try? JSONSerialization.data(withJSONObject: fullJSON["digest"].object, options: .sortedKeys)

            var existingRecipe = Recipe.getRecipeBySource(source: source)
            if existingRecipe != nil {
                existingRecipe = self.updateRecipe(oldRecipe: existingRecipe!,
                                                   title: title,
                                                   source: source,
                                                   calories: calories,
                                                   ingredientLines: ingredients,
                                                   imageURL: imageURL,
                                                   yield: yield,
                                                   digestiveInfo: digestiveInfo,
                                                   totalDailyNutrients: totalDailyNutrients)

            } else {
                existingRecipe = self.createRecipe(title: title,
                                                   source: source,
                                                   calories: calories,
                                                   ingredientLines: ingredients,
                                                   imageURL: imageURL,
                                                   yield: yield,
                                                   digestiveInfo: digestiveInfo,
                                                   totalDailyNutrients: totalDailyNutrients)
            }
            return existingRecipe
        }
        return nil
    }

    class func getRecipeBySource(source: String) -> Recipe? {
        if let existingRecipe = Recipe.mr_findFirst(byAttribute: "source", withValue: source) {
            return existingRecipe
        }
        return nil
    }

    class func createRecipe(title: String,
                            source: String,
                            calories: Double,
                            ingredientLines: [String]?,
                            imageURL: String?,
                            yield: Double?,
                            digestiveInfo: Data?,
                            totalDailyNutrients: Data?) -> Recipe {
        let newRecipe = Recipe.mr_createEntity() as! Recipe
        newRecipe.title = title
        newRecipe.source = source
        newRecipe.calories = calories
        newRecipe.arrayIngredients = ingredientLines
        newRecipe.imageUrl = imageURL
        newRecipe.digestiveInfo = digestiveInfo
        newRecipe.totalDaily = totalDailyNutrients
        newRecipe.yield = yield ?? 0.0
        return newRecipe
    }

    class func updateRecipe(oldRecipe: Recipe,
                            title: String,
                            source: String,
                            calories: Double,
                            ingredientLines: [String]?,
                            imageURL: String?,
                            yield: Double?,
                            digestiveInfo: Data?,
                            totalDailyNutrients: Data?) -> Recipe {
        oldRecipe.title = title
        oldRecipe.source = source
        oldRecipe.calories = calories
        oldRecipe.arrayIngredients = ingredientLines
        oldRecipe.imageUrl = imageURL
        oldRecipe.yield = yield ?? 0.0
        oldRecipe.digestiveInfo = digestiveInfo
        oldRecipe.totalDaily = totalDailyNutrients
        return oldRecipe
    }
}
