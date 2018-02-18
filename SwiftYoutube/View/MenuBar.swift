//
//  MenuBar.swift
//  SwiftYoutube
//
//  Created by Manan Patel on 2018-02-18.
//  Copyright © 2018 Manan Patel. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    
    lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.init(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellID = "cellID"
    
    let images = ["home","trending","subscriptions","account"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.init(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        
        self.addSubview(cv)
        cv.anchor(top: self.safeTopAnchor, leading: self.safeLeadingAnchor, bottom: self.safeBottomAnchor, trailing: self.safeTrailingAnchor)
        cv.register(MenuCell.self, forCellWithReuseIdentifier: cellID)
        
        let selectedIP = NSIndexPath(item: 0, section: 0)
        cv.selectItem(at: selectedIP as IndexPath, animated: false, scrollPosition: .top)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MenuCell
        cell.tintColor = UIColor.init(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
        cell.imageView.image = UIImage(named:images[indexPath.row])?.withRenderingMode(.alwaysTemplate)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

class MenuCell: BaseCell {
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.tintColor = UIColor.init(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet{
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.init(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
        }
    }
    
    override var isSelected: Bool {
        didSet{
            imageView.tintColor = isSelected ? UIColor.white : UIColor.init(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        self.addSubview(imageView)
        imageView.anchor(top: self.safeTopAnchor, leading: self.safeLeadingAnchor, bottom: self.safeBottomAnchor, trailing: self.safeTrailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10) )
    }
}
