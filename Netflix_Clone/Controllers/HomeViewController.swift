//
//  HomeViewController.swift
//  Netflix_Clone
//
//  Created by Sihan on 15/11/23.
//
import UIKit

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTVs = 1
    case Popular = 2
    case Upcoming = 3
    case Toprated = 4
}

class HomeViewController: UIViewController {
    
    let sectionTitle: [String] = ["Trending Movies", "Trending TV", "Popular", "Upcoming Movies", "Top rated"]
    
    let model = APICallerTitle()
//    let model = APICaller()
    
    private var homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewController.self, forCellReuseIdentifier: CollectionViewTableViewController.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configureNavBar()
        
        let headerView = HeroHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
        

    }
    
    private func configureNavBar() {
        var image = UIImage(named: "netflix-logo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil),
        ]
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    
    //to avoid navbar stick to the top
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
//    private func getTrendingMovies(){
//        model.getTrendingMovies { results in
//            switch results {
//            case .success(let movies):
//                print(movies[0])
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//
//    private func getTrendingTVs(){
//        model.getTrendingTVs { results in
//            switch results {
//            case .success(let tv):
//                print(tv[0])
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//
//    private func getUpcomingMovies(){
//        APICaller.shared.getUpcomingMovies { results in
//            switch results {
//            case .success(let upcoming):
//                print(upcoming[0])
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//
//    private func getPopularMovies(){
//        APICaller.shared.getPopularMovies { results in
//            switch results {
//            case .success(let popular):
//                print(popular[0])
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//
//    private func getTopRatedMovies(){
//        APICaller.shared.getTopRatedMovies { results in
//            switch results {
//            case .success(let topRated):
//                print(topRated[0])
//            case .failure(let error):
//                print(error)
//            }
//
//        }
//    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {
            return
        }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewController.identifier, for: indexPath) as? CollectionViewTableViewController else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case Sections.TrendingMovies.rawValue:
            APICallerTitle.shared.getTrendingMovies { results in
                switch results {
                case .success(let movies):
                    cell.configTitle(with: movies)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.TrendingTVs.rawValue:
            APICallerTitle.shared.getTrendingTVs { results in
                switch results {
                case .success(let tv):
                    cell.configTitle(with: tv)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.Popular.rawValue:
            APICallerTitle.shared.getPopularMovies{ results in
                switch results {
                case .success(let popular):
                    cell.configTitle(with: popular)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.Upcoming.rawValue:
            APICallerTitle.shared.getUpcomingMovies{ results in
                switch results {
                case .success(let upcoming):
                    cell.configTitle(with: upcoming)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.Toprated.rawValue:
            APICallerTitle.shared.getTopRatedMovies{ results in
                switch results {
                case .success(let toprated):
                    cell.configTitle(with: toprated)
                case .failure(let error):
                    print(error)
                }
            }
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
