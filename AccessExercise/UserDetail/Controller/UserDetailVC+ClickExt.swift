//
//  UserDetailVC+ClickExt.swift
//  AccessExercise
//
//  Created by APPLE on 2020/3/17.
//  Copyright © 2020 APPLE. All rights reserved.
//

import UIKit

extension UserDetailVC {
    @IBAction func click_Blog (_ sender :UIButton) -> Void {
        if let url = URL(string: sender.title(for: .normal) ?? "") {
           UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
