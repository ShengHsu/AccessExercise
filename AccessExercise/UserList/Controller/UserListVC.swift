//
//  UserListVC.swift
//  AccessExercise
//
//  Created by APPLE on 2020/3/17.
//  Copyright © 2020 APPLE. All rights reserved.
//

import UIKit

class UserListVC: UIViewController {
    //UI
    @IBOutlet weak var mTableView_Main: UITableView!
    
    //ViewModel
    internal var viewModel: UserListViewModel!
    
    //Data
    var selectIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = UserListViewModel(apiService: ApiService())
        configDataBinding()
        viewModel.fetchUserData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUserDetail" {
            if let destination = segue.destination as? UserDetailVC {
                destination.LoginID = viewModel.mArray_UserDataList[selectIndex].getLogin
            }
        }
    }
    
    deinit {
        viewModel.removeObserver(self, forKeyPath: "isReadyFetchListData")
    }
    
    private func configDataBinding() {
        viewModel.addObserver(self, forKeyPath:"isReadyFetchListData", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "isReadyFetchListData" {
            mTableView_Main.reloadData()
        }
    }
    
    @IBAction func unwindToBack_UserList (segue: UIStoryboardSegue) {
        print("back to user list")
    }

}
