//
//  NetworkManager.swift
//  CHEFFIN
//
//  Created by Yash Rao on 12/25/18.
//  Copyright © 2018 Yash Rao. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class NetworkManager: NSObject {

    override init() {
        super.init()
    }

    class func buildURL(api: API, parameters: [String:String]) -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = BUILD_URL.SCHEME.rawValue
        urlComponents.host = BUILD_URL.HOST.rawValue
        switch api {
        case .FOOD:
            urlComponents.path = BUILD_URL.FOOD_PATH.rawValue
        case .NUTRITION:
            urlComponents.path = BUILD_URL.NUTRITION_PATH.rawValue
        case .RECIPE:
            urlComponents.path = BUILD_URL.RECIPE_PATH.rawValue
        }
        urlComponents.queryItems = [URLQueryItem]()

        for (key,value) in parameters {
            if !value.isEmpty || value != "nil" {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                urlComponents.queryItems?.append(queryItem)
            }
        }
        return urlComponents.url!
    }

    class func generateAPIParameters(api: API, parameters: inout [String:String]) -> [String:String] {
        switch api {
        case .FOOD:
            parameters["app_id"] = APP_ID.FOOD.rawValue
            parameters["app_key"] = APP_KEY.FOOD.rawValue
        case .NUTRITION:
            parameters["app_id"] = APP_ID.NUTRITION.rawValue
            parameters["app_key"] = APP_KEY.NUTRITION.rawValue
        case .RECIPE:
            parameters["app_id"] = APP_ID.RECIPE.rawValue
            parameters["app_key"] = APP_KEY.RECIPE.rawValue
        }
        return parameters
    }

    class func standardGETRequest(url: URL, completionJSON: @escaping (Bool, JSON?) -> Void) {
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseString() { response in
            guard response.error == nil else {
                debugPrint("Error with response \(response.error)")
                completionJSON(false, nil)
                return
            }
            guard response.response?.statusCode == 200 else {
                debugPrint("HTTP Status code besides 200 recieved \(response.response?.statusCode)")
                completionJSON(false, nil)
                return
            }
            do {
                let json = try JSON(data: response.data!)
                print("JSON", json)
                completionJSON(true, json)
            } catch {
                completionJSON(false, nil)
            }
        }
    }
}
