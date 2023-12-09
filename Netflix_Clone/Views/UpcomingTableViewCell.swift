//
//  UpcomingTableViewCell.swift
//  Netflix_Clone
//
//  Created by Sihan on 3/12/23.
//

import UIKit
import SDWebImage

class UpcomingTableViewCell: UITableViewCell {
    
    static let identifier = "UpcomingTableViewCell"
    
    private let posterImage: UIImageView = {
        let posterImage = UIImageView()
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        posterImage.contentMode = .scaleAspectFill
        posterImage.clipsToBounds = true
        return posterImage
    }()
    
    private let movieTitle: UILabel = {
        let movieTitle = UILabel()
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.numberOfLines = 0
        return movieTitle
    }()
    
    private let playBtn: UIButton = {
        let playBtn = UIButton()
        playBtn.setImage(UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40)), for: .normal)
        playBtn.translatesAutoresizingMaskIntoConstraints = false
        playBtn.tintColor = .white
        return playBtn
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(posterImage)
        contentView.addSubview(movieTitle)
        contentView.addSubview(playBtn)
        
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //posterImage.frame = contentView.bounds
    }
    
    private func applyConstraints(){
        NSLayoutConstraint.activate([
            posterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            posterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            posterImage.widthAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            movieTitle.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 20),
            movieTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            playBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    public func configure(with model: UpcomingViewModel){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {return}
        posterImage.sd_setImage(with: url, completed: nil)
        movieTitle.text = model.titleName
    }

}
