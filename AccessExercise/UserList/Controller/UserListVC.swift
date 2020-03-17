//
//  UserListVC.swift
//  AccessExercise
//
//  Created by APPLE on 2020/3/17.
//  Copyright © 2020 APPLE. All rights reserved.
//

import UIKit

class UserListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func unwindToBack_UserList (segue: UIStoryboardSegue) {
        print("back to user list")
    }

}
