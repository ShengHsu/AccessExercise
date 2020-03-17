//
//  UserDetailViewModel.swift
//  AccessExercise
//
//  Created by APPLE on 2020/3/17.
//  Copyright © 2020 APPLE. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserDetailViewModel: NSObject {
    
    @objc dynamic var isReadyFetchDetailData: Bool = false
    
    fileprivate let apiService: ApiService
    
    private(set) var userDetailData: UserDetailModel = UserDetailModel()
    private(set) var Login_ID: String!
    
    init(login_id: String, apiService: ApiService) {
        self.apiService = apiService
        self.Login_ID = login_id
        super.init()
    }
    
    func fetchUserData () {
        apiService.GET_UserDetailData(login: Login_ID) { response in
            switch response.result {
            case .success:
                print("\(response)")
                if let json = try? JSON(data: response.data!) {
                    self.userDetailData = UserDetailModel(jsonData: json)
                    
                    //After get data, callback to controller.
                    self.isReadyFetchDetailData = true
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

