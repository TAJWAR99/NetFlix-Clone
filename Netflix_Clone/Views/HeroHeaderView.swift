//
//  HeroHeaderViewController.swift
//  Netflix_Clone
//
//  Created by Sihan on 15/11/23.
//

import UIKit

class HeroHeaderView: UIView {
    
    private let playBtn: UIButton = {
        let playBtn = UIButton()
        playBtn.setTitle("Play", for: .normal)
        playBtn.layer.borderColor = UIColor.white.cgColor
        playBtn.layer.borderWidth = 1
        playBtn.translatesAutoresizingMaskIntoConstraints = false
        return playBtn
        
    }()
    
    private let downloadBtn: UIButton = {
        let downloadBtn = UIButton()
        downloadBtn.setTitle("Download", for: .normal)
        downloadBtn.layer.borderColor = UIColor.white.cgColor
        downloadBtn.layer.borderWidth = 1
        downloadBtn.translatesAutoresizingMaskIntoConstraints = false
        return downloadBtn
        
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
        
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
        
    }
    
    private func applyConstraints() {
        let playBtnConstraints = [
            playBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playBtn.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        let downloadBtnConstraint = [
            downloadBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadBtn.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        NSLayoutConstraint.activate(playBtnConstraints)
        NSLayoutConstraint.activate(downloadBtnConstraint)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(heroImageView)
        addGradient()
        
        addSubview(playBtn)
        addSubview(downloadBtn)
        
        applyConstraints()
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
}
