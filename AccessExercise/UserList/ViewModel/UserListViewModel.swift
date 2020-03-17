//
//  UserListViewModel.swift
//  AccessExercise
//
//  Created by APPLE on 2020/3/17.
//  Copyright © 2020 APPLE. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserListViewModel: NSObject {
    
    @objc dynamic var isReadyFetchListData: Bool = false
    
    fileprivate let apiService: ApiService
    
    private(set) var mArray_UserDataList: [UserDataModel] = []
    
    init(apiService: ApiService) {
        self.apiService = apiService
        super.init()
    }
    
    func fetchUserData () {
        apiService.GET_UserListData { response in
            switch response.result {
            case .success:
                print("\(response)")
                if let json = try? JSON(data: response.data!) {
                    self.mArray_UserDataList.removeAll()
                    for data in json.arrayValue {
                        let model = UserDataModel(jsonData: data)
                        self.mArray_UserDataList.append(model)
                    }
                    
                    //After get data, callback to controller.
                    self.isReadyFetchListData = true
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
