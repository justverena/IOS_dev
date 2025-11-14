//
//  FavoriteCell.swift
//  TableViewApp
//
//  Created by Verena Gaaze on 14.11.2025.
//
import UIKit

final class FavoriteCell: UITableViewCell {
    static let reuseIdentifier = "FavoriteCell"

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Dynamic Type
        titleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.adjustsFontForContentSizeCategory = true
        reviewLabel.adjustsFontForContentSizeCategory = true

        // Prevent unexpected compression
        titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        subtitleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        reviewLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }

    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        reviewLabel.text = item.review

        if let name = item.imageName, !name.isEmpty {
            if let img = UIImage(named: name) {
                coverImageView.image = img
            } else if let symbol = UIImage(systemName: name) {
                coverImageView.image = symbol
            } else {
                coverImageView.image = UIImage(systemName: "photo")
            }
        } else {
            coverImageView.image = UIImage(systemName: "photo")
        }
    }

    // Avoiding force unwraps, outlets are optional but connected in storyboard
    override func prepareForReuse() {
        super.prepareForReuse()
        coverImageView.image = nil
        titleLabel.text = nil
        subtitleLabel.text = nil
        reviewLabel.text = nil
    }
}
