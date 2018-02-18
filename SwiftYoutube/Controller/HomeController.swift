//
//  ViewController.swift
//  SwiftYoutube
//
//  Created by Manan Patel on 2018-02-18.
//  Copyright © 2018 Manan Patel. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        navigationItem.titleView = titleLabel
        
        collectionView?.backgroundColor = .white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellID")
        
        collectionView?.contentInset = .init(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = .init(top: 50, left: 0, bottom: 0, right: 0)
        
        setupMenuBar()
    }
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        menuBar.anchor(top: view.safeTopAnchor, leading: view.safeLeadingAnchor, bottom: nil, trailing: view.safeTrailingAnchor, padding: .init(top: 0, left: 0, bottom: 5, right: 0), size: .init(width: 0, height: 50))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = ((view.frame.width - 5 - 5) * 9/16) + 60
        return CGSize(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

