//
//  UserListCell.swift
//  AccessExercise
//
//  Created by APPLE on 2020/3/17.
//  Copyright © 2020 APPLE. All rights reserved.
//

import UIKit
import Kingfisher

class UserListCell: UITableViewCell {
    @IBOutlet weak var mImageView_Avatar: UIImageView!
    @IBOutlet weak var mLabel_Login: UILabel!
    @IBOutlet weak var mView_SiteAdmin: UIView!

    func setCell(modelData: UserDataModel) {
        mLabel_Login.text = modelData.getLogin
        
        if modelData.getSiteAdmin {
            mView_SiteAdmin.isHidden = false
        } else {
            mView_SiteAdmin.isHidden = true
        }
        
        if let avatar_url  = URL(string: modelData.getAvatarURL) {
            mImageView_Avatar.kf.setImage(with: avatar_url)
        }
    }
}
