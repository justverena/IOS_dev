//
//  ViewController.swift
//  AdvancedHeroApp
//
//  Created by Verena Gaaze on 04.12.2025.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!

    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!

    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var affiliationLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!

    @IBOutlet weak var randomizeButton: UIButton!

    private var heroes: [Superhero] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        loadAllHeroes()
    }

    private func loadAllHeroes() {
        APIClientAF.shared.fetchAllHeroes { [weak self] result in
            guard let self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let heroes):
                    self.heroes = heroes
                    if let savedID = HeroStorage.shared.loadLastHeroID(),
                       let savedHero = heroes.first(where: { $0.id == savedID }) {
                        // show last saved hero
                        self.updateUI(with: savedHero)
                    } else {
                        // no saved hero, show random
                        self.showRandomHero()
                    }

                case .failure(let error):
                    self.showError(error)
                }
            }
        }
    }

    @IBAction func randomizeTapped(_ sender: UIButton) {
        UIView.transition(with: self.view,
                          duration: 0.5,
                          options: .transitionCrossDissolve) {
            self.showRandomHero()
        }
    }

    private func showRandomHero() {
        guard !heroes.isEmpty else { return }

        let hero = heroes.randomElement()!
        HeroStorage.shared.saveLastHeroID(hero.id)

        updateUI(with: hero)
    }

    private func updateUI(with hero: Superhero) {

        nameLabel.text = hero.name
        fullNameLabel.text = hero.biography?.fullName ?? "—"

        genderLabel.text = "Gender: \(hero.appearance?.gender ?? "—")"
        heightLabel.text = "Height: \(hero.appearance?.height?.first ?? "—")"
        weightLabel.text = "Weight: \(hero.appearance?.weight?.first ?? "—")"

        intelligenceLabel.text = "Intelligence: \(hero.powerstats?.intelligence ?? 0)"
        alignmentLabel.text = "Alignment: \(hero.biography?.alignment ?? "—")"
        speedLabel.text = "Speed: \(hero.powerstats?.speed ?? 0)"
        occupationLabel.text = "Work: \(hero.work?.occupation ?? "—")"
        powerLabel.text = "Power: \(hero.powerstats?.power ?? 0)"
        affiliationLabel.text = "Group: \(hero.connections?.groupAffiliation ?? "—")"
        publisherLabel.text = "Publisher: \(hero.biography?.publisher ?? "—")"

        if let urlString = hero.images?.lg ?? hero.images?.md ?? hero.images?.sm,
           let url = URL(string: urlString) {
            heroImageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "placeholder"),
                options: [.transition(.fade(0.3))]
            )
        }
    }

    private func showError(_ error: Error) {
        let alert = UIAlertController(
            title: "Error",
            message: "Failed to load heroes. Please try again.\n\(error.localizedDescription)",
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "Retry", style: .default) { _ in
            self.loadAllHeroes()
        })

        present(alert, animated: true)
    }
}
