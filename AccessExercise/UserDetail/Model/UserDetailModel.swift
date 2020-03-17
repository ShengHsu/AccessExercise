//
//  UserDetailModel.swift
//  AccessExercise
//
//  Created by APPLE on 2020/3/17.
//  Copyright © 2020 APPLE. All rights reserved.
//

import SwiftyJSON

struct UserDetailModel {
    
    private var _avatar_url: String!
    private var _login: String!
    private var _site_admin: Bool = false
    private var _name: String!
    private var _location: String!
    private var _blog: String!
    
    init() {}
    
    init (jsonData:JSON) {
        _avatar_url = jsonData["avatar_url"].stringValue
        _login = jsonData["login"].stringValue
        _site_admin = jsonData["date"].boolValue
        _name = jsonData["name"].stringValue
        _location = jsonData["location"].stringValue
        _blog = jsonData["blog"].stringValue
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
    
    var getName: String {
        get { return _name }
    }
    
    var getLocation: String {
        get { return _location }
    }
    
    var getBlog: String {
        get { return _blog }
    }
}
