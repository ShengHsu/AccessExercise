//
//  UserListVC+TableViewExt.swift
//  AccessExercise
//
//  Created by APPLE on 2020/3/17.
//  Copyright © 2020 APPLE. All rights reserved.
//

import UIKit

private let reuseIdentifer = "UserListCell"

extension UserListVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.mArray_UserDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as? UserListCell {
            cell.setCell(modelData: viewModel.mArray_UserDataList[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    
}
