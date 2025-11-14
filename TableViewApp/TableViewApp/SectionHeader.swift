//
//  SectionHeader.swift
//  TableViewApp
//
//  Created by Verena Gaaze on 14.11.2025.
//

import UIKit

final class SectionHeaderView: UIView {
    private let titleLabel = UILabel()
    private let iconLabel = UILabel()

    init(title: String, emoji: String) {
        super.init(frame: .zero)
        setup(title: title, emoji: emoji)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup(title: "", emoji: "")
    }

    private func setup(title: String, emoji: String) {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 8
        clipsToBounds = true

        iconLabel.text = emoji
        iconLabel.font = .systemFont(ofSize: 20)
        iconLabel.setContentHuggingPriority(.required, for: .horizontal)

        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .label

        let hstack = UIStackView(arrangedSubviews: [iconLabel, titleLabel])
        hstack.axis = .horizontal
        hstack.spacing = 8
        hstack.alignment = .center
        hstack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(hstack)
        NSLayoutConstraint.activate([
            hstack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            hstack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            hstack.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            hstack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
