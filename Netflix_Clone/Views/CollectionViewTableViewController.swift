//
//  CollectionViewTableViewController.swift
//  Netflix_Clone
//
//  Created by Sihan on 15/11/23.
//

import UIKit

class CollectionViewTableViewController: UITableViewCell {

    static let identifier = "CollectionViewTableViewController"
    
    private var title:[Title] = [Title]()
    
//    private var movies:[Movie] = [Movie]()
//    private var tv:[Tv] = [Tv]()
//    private var upcoming:[Upcoming] = [Upcoming]()
//    private var popular:[Popular] = [Popular]()
//    private var toprated:[TopRated] = [TopRated]()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //collectionView.register(CollectionViewTableViewController.self, forCellWithReuseIdentifier: CollectionViewTableViewController.identifier)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    
    //Get the url and append in the array
    public func configTitle(with title: [Title]){
        self.title = title
        DispatchQueue.main.async {
            [weak self] in
            self?.collectionView.reloadData()
        }
    }
//    public func configMovies(with movies: [Movie]){
//        self.movies = movies
//        DispatchQueue.main.async {
//            [weak self] in
//            self?.collectionView.reloadData()
//        }
//    }
//    public func configTVs(with tvs: [Tv]){
//        self.tv = tvs
//        DispatchQueue.main.async {
//            [weak self] in
//            self?.collectionView.reloadData()
//        }
//    }
//    public func configUpcoming(with upcoming: [Upcoming]){
//        self.upcoming = upcoming
//        DispatchQueue.main.async {
//            [weak self] in
//            self?.collectionView.reloadData()
//        }
//    }
//    public func configPopular(with popular: [Popular]){
//        self.popular = popular
//        DispatchQueue.main.async {
//            [weak self] in
//            self?.collectionView.reloadData()
//        }
//    }
//    public func configTopRated(with toprated: [TopRated]){
//        self.toprated = toprated
//        DispatchQueue.main.async {
//            [weak self] in
//            self?.collectionView.reloadData()
//        }
//    }

}

extension CollectionViewTableViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return title.count
//        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
            
        }
//        guard let model = movies[indexPath.row].poster_path else {
//            return UICollectionViewCell()
//        }
        guard let model = title[indexPath.row].poster_path else {
            return UICollectionViewCell()
            
        }
        cell.configure(with: model)
        return cell
    }
    
    
}
