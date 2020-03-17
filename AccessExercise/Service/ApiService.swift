//
//  ApiService.swift
//  AccessExercise
//
//  Created by APPLE on 2020/3/17.
//  Copyright © 2020 APPLE. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiService: NSObject {

    func GET_UserListData(callback: @escaping ((AFDataResponse<Any>) -> Void)) {
        let todosEndpoint: String = "https://api.github.com/users"
        AF.request(todosEndpoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: callback)
    }
    
    func GET_UserDetailData(login: String, callback: @escaping ((AFDataResponse<Any>) -> Void)) {
        let todosEndpoint: String = "https://api.github.com/users/" + login
        AF.request(todosEndpoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: callback)
    }
}
