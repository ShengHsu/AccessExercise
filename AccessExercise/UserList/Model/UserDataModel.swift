//
//  UserDataModel.swift
//  AccessExercise
//
//  Created by APPLE on 2020/3/17.
//  Copyright © 2020 APPLE. All rights reserved.
//

import SwiftyJSON

struct UserDataModel {
    
    private var _avatar_url: String!
    private var _login: String!
    private var _site_admin: Bool = false

    init () {}
    
    init (jsonData:JSON) {
        _avatar_url = jsonData["avatar_url"].stringValue
        _login = jsonData["login"].stringValue
        _site_admin = jsonData["date"].boolValue
    }

    var getAvatarURL: String {
        get { return _avatar_url }
    }
    
    var getLogin: String {
        get { return _login }
    }
    
    var getSiteAdmin: Bool {
        get { return _site_admin }
    }
    
}
