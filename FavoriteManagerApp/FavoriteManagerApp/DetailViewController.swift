//
//  DetailViewController.swift
//  FavoriteManagerApp
//
//  Created by Verena Gaaze on 22.11.2025.
//
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!

    var item: FavoriteItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        populate()
    }


    private func populate() {
        guard let item = item else { return }
        detailTitleLabel.text = item.title
        descriptionLabel.text = item.description
        reviewLabel.text = item.review

        if let img = UIImage(named: item.imageName) {
            detailImageView.image = img
        } else {
            detailImageView.image = UIImage(systemName: item.imageName)
        }
    }
}
