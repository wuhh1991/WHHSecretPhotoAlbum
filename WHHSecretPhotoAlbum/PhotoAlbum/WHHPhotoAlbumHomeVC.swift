//
//  WHHPhotoAlbumHomeVC.swift
//  WHHSecretPhotoAlbum
//
//  Created by 吴煌辉 on 2018/7/18.
//  Copyright © 2018年 whh. All rights reserved.
//

import UIKit

class WHHPhotoAlbumHomeVC : UIViewController {
    
    var collection : UICollectionView?
    var albumList : Array<WHHPhotoAlbumModel>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "相册"
        view.backgroundColor = UIColor.white
        
        initAlbumList()
        
        let navRightBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(WHHPhotoAlbumHomeVC.navRightBtnClick))
        self.navigationItem.rightBarButtonItem = navRightBtn
        
        let itemWidth = (UIScreen.main.bounds.width - 3 * 10) / 2.0
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let y = UIApplication.shared.statusBarFrame.height + (self.navigationController?.navigationBar.frame.height)!
        collection = UICollectionView(frame: CGRect(x: 0, y: y, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - y), collectionViewLayout:layout)
        collection?.showsHorizontalScrollIndicator = false
        collection?.showsVerticalScrollIndicator = false
        collection?.register(WHHPhotoAlbumCell.self, forCellWithReuseIdentifier: "collectionCell")
        collection?.backgroundColor = UIColor.white
        collection?.delegate = self
        collection?.dataSource = self
        view.addSubview(collection!)
    }
    
    func initAlbumList() {
        let album = WHHPhotoAlbumModel()
        album.title = "测试一下"
        albumList = [album]
    }
    
    @objc func navRightBtnClick() {
        let alert = UIAlertController(title: "新建相册", message: "请输入相册名称", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "请输入相册名称"
        }
        
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "确认", style: .default, handler: { alertAction in
            let album = WHHPhotoAlbumModel()
            album.title = alert.textFields?.first?.text
            self.albumList?.append(album)
            self.collection?.reloadData()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension WHHPhotoAlbumHomeVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.albumList?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! WHHPhotoAlbumCell
        cell.coverImage.backgroundColor = UIColor.orange
        cell .update(data: albumList?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoListVC = WHHPhotoListVC()
        self.navigationController?.pushViewController(photoListVC, animated: true)
        
    }
}
