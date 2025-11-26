//
//  FavoritesListViewController.swift
//  FavoriteManagerApp
//
//  Created by Verena Gaaze on 22.11.2025.
//
import UIKit

class FavoriteListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items: [FavoriteItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCell else {
            fatalError("Cell is not of type FavoriteCell or identifier mismatch")
        }

        let item = items[indexPath.row]
        cell.titleLabel.text = item.title
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        detailVC.item = items[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
