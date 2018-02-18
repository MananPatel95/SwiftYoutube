//
//  VideoCell.swift
//  SwiftYoutube
//
//  Created by Manan Patel on 2018-02-18.
//  Copyright © 2018 Manan Patel. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VideoCell: BaseCell {
    
    let thumbNailView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "taylor_swift_blank_space")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    let userProfileView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "taylor_swift_profile")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.backgroundColor = .green
        view.layer.cornerRadius = 22
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Taylor Swift - Blank Space"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let tv = UITextView()
        tv.text = "TaylorSwiftVEVO • 1,604,687,536 • 2 years"
        tv.textColor = .gray
        tv.isScrollEnabled = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.textContainerInset = .init(top: 0, left: -4, bottom: 0, right: 0)
        return tv
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.alpha = 0.1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setupViews() {
        addSubview(thumbNailView)
        thumbNailView.anchor(top: self.safeTopAnchor, leading: self.safeLeadingAnchor, bottom: nil, trailing: self.safeTrailingAnchor, padding: .init(top: 10, left: 5, bottom: 10, right: 5))
        
        addSubview(userProfileView)
        userProfileView.anchor(top: thumbNailView.safeBottomAnchor, leading: self.safeLeadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 5, bottom: 5, right: 5), size: .init(width: 44, height: 44))
        
        addSubview(titleLabel)
        titleLabel.anchor(top: thumbNailView.safeBottomAnchor, leading: userProfileView.safeTrailingAnchor, bottom: nil, trailing: self.safeTrailingAnchor, padding: .init(top: 10, left: 10, bottom: 5, right: 5), size: .init(width: 0, height: 22))
        
        addSubview(subtitleTextView)
        subtitleTextView.anchor(top: titleLabel.safeBottomAnchor, leading: userProfileView.safeTrailingAnchor, bottom: nil, trailing: self.safeTrailingAnchor, padding: .init(top: 0, left: 10, bottom: 5, right: 5), size: .init(width: 0, height: 22))
        
        addSubview(lineView)
        lineView.anchor(top: subtitleTextView.safeBottomAnchor, leading: self.safeLeadingAnchor, bottom: self.safeBottomAnchor, trailing: self.safeTrailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 1))
    }
    
}

