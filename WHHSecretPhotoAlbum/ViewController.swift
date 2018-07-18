//
//  ViewController.swift
//  WHHSecretPhotoAlbum
//
//  Created by 吴煌辉 on 2018/7/18.
//  Copyright © 2018年 whh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ""
        
        let openBtn = UIButton(type: .custom)
        openBtn.setTitle("登录", for: .normal)
        openBtn.setTitleColor(.blue, for: .normal)
        openBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 30)
        openBtn.center = view.center
        view.addSubview(openBtn)
        openBtn.addTarget(self, action: #selector(openBtnClick), for: .touchUpInside)
        
    }

    @objc func openBtnClick() {
        
        let home = WHHPhotoAlbumHomeVC()
        self.navigationController?.pushViewController(home, animated: true)

    }
}

