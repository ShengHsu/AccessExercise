//
//  UserDetailVC.swift
//  AccessExercise
//
//  Created by APPLE on 2020/3/17.
//  Copyright © 2020 APPLE. All rights reserved.
//

import UIKit

class UserDetailVC: UIViewController {
    //UI
    @IBOutlet weak var mImageView_Avatar: UIImageView!
    @IBOutlet weak var mLabel_Name: UILabel!
    @IBOutlet weak var mLabel_Login: UILabel!
    @IBOutlet weak var mView_SiteAdmin: UIView!
    @IBOutlet weak var mLabel_Location: UILabel!
    @IBOutlet weak var mButton_Blog: UIButton!
    
    //ViewModel
    internal var viewModel: UserDetailViewModel!
    
    //Data
    var LoginID: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = UserDetailViewModel(login_id: LoginID, apiService: ApiService())
        configDataBinding()
        viewModel.fetchUserData()
    }
    
    deinit {
        viewModel.removeObserver(self, forKeyPath: "isReadyFetchDetailData")
    }
    
    private func configDataBinding() {
        viewModel.addObserver(self, forKeyPath:"isReadyFetchDetailData", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "isReadyFetchDetailData" {
            setData()
        }
    }
    
    func setData() {
        mLabel_Name.text = viewModel.userDetailData.getName
        mLabel_Login.text = viewModel.userDetailData.getLogin
        mLabel_Location.text = viewModel.userDetailData.getLocation
        mButton_Blog.setTitle(viewModel.userDetailData.getBlog, for: .normal)
        
        if viewModel.userDetailData.getSiteAdmin {
            mView_SiteAdmin.isHidden = false
        } else {
            mView_SiteAdmin.isHidden = true
        }
        
        if let avatar_url  = URL(string: viewModel.userDetailData.getAvatarURL) {
            mImageView_Avatar.kf.setImage(with: avatar_url)
        }
    }
}
