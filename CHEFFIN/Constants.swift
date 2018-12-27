//
//  Constants.swift
//  CHEFFIN
//
//  Created by Yash Rao on 12/25/18.
//  Copyright © 2018 Yash Rao. All rights reserved.
//

import Foundation

enum API: String {
    case FOOD
    case RECIPE
    case NUTRITION
}

enum BUILD_URL: String {
    case SCHEME = "https"
    case HOST = "api.edamam.com"
    case FOOD_PATH = "api/food-database/parser"
    case RECIPE_PATH = "/search"
    case NUTRITION_PATH = "/api/nutrition-details"
}

enum APP_ID: String {
    case FOOD = "8d6b6836"
    case RECIPE = "143d5e83"
    case NUTRITION = "ac72b304"
}

enum APP_KEY: String {
    case FOOD = "1042b66ebc9e196324355fe6742414c6"
    case RECIPE = "3a8a476829239dd7ac0cf62826467ec3"
    case NUTRITION = "72d5719872fdb4d13db58167462b0a62"
}

enum RECIPE_SEARCH_PARAMS: String {
    case q
    case r
    case from
    case to
    case ingr
    case diet
    case health
    case calories
    case time
    case excluded
    case callback
}

enum DIET_LABELS: String {
    case BALANCED = "balanced"
    case HIGHPROTEIN = "high-protein"
    case HIGHFIBER = "high-fiber"
    case LOWFAT = "low-fat"
    case LOWCARB = "low-carb"
    case LOWSODIUM = "low-sodium"
}
