//
//  WHHPhotoListVC.swift
//  WHHSecretPhotoAlbum
//
//  Created by 吴煌辉 on 2018/7/18.
//  Copyright © 2018年 whh. All rights reserved.
//

import UIKit

class WHHPhotoListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "所有照片"
        view.backgroundColor = UIColor.white
        
        let navRightBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(navRightBtnClick))
        self.navigationItem.rightBarButtonItem = navRightBtn
    }
    
    @objc func navRightBtnClick() {
        
    }
}
