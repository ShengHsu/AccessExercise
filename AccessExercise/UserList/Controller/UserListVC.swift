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

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = UserListViewModel(apiService: ApiService())
        configDataBinding()
        viewModel.fetchUserData()
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
