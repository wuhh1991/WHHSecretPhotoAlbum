//
//  WHHPhotoAlbumCell.swift
//  WHHSecretPhotoAlbum
//
//  Created by 吴煌辉 on 2018/7/18.
//  Copyright © 2018年 whh. All rights reserved.
//

import UIKit

class WHHPhotoAlbumCell: UICollectionViewCell {
    
    let coverImage = UIImageView()
    let titleLabel = UILabel()
    let totalLabel = UILabel()
    var cellData : WHHPhotoAlbumModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        coverImage.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - 40)
        self.contentView.addSubview(coverImage)
        
        titleLabel.frame = CGRect(x: 0, y: self.frame.height - 40, width: self.frame.width, height: 20)
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(titleLabel)

        totalLabel.frame = CGRect(x: 0, y: self.frame.height - 20, width: self.frame.width, height: 20)
        totalLabel.textColor = UIColor.gray
        totalLabel.font = UIFont.systemFont(ofSize: 13)
        self.contentView.addSubview(totalLabel)
    }
    
    func update(data:WHHPhotoAlbumModel?) {
        cellData = data
        titleLabel.text = cellData?.title
        totalLabel.text =  cellData != nil ? String(cellData!.total) : "0"
    }
}
