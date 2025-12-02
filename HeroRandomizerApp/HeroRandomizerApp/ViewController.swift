//
//  ViewController.swift
//  HeroRandomizerApp
//
//  Created by Verena Gaaze on 02.12.2025.
//

    import UIKit

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
            APIClient.shared.fetchAllHeroes { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let heroes):
                        guard !heroes.isEmpty else { return }
                        self?.heroes = heroes
                        self?.showRandomHero()
                    case .failure(let error):
                        self?.showError(error)
                    }
                }
            }
        }
        
        @IBAction func randomizeTapped(_ sender: UIButton) {
            UIView.transition(with: self.view,
                              duration: 0.6,
                              options: .transitionCrossDissolve,
                              animations: {
                self.showRandomHero()
            })
        }
        
        private func showRandomHero() {
            guard !heroes.isEmpty else { return }
            let hero = heroes.randomElement()!
            updateUI(with: hero)
        }
        
        private func updateUI(with hero: Superhero) {

            
            nameLabel.text = hero.name
            fullNameLabel.text = hero.biography?.fullName?.isEmpty == false
                ? hero.biography?.fullName
                : hero.biography?.publisher ?? "—"
            
            genderLabel.text = "Gender: \(hero.appearance?.gender ?? "—")"
            heightLabel.text = "Height: \(hero.appearance?.height?.first ?? "—")"
            weightLabel.text = "Weight: \(hero.appearance?.weight?.first ?? "—")"
            intelligenceLabel.text = "Intelligence: \(hero.powerstats?.intelligence?.description ?? "—")"
            alignmentLabel.text = "Alignment: \(hero.biography?.alignment ?? "—")"
            speedLabel.text = "Speed: \(hero.powerstats?.speed?.description ?? "—")"
            occupationLabel.text = "Occupation: \(hero.work?.occupation ?? "—")"
            powerLabel.text = "Power: \(hero.powerstats?.power?.description ?? "—")"
            affiliationLabel.text = "Group: \(hero.connections?.groupAffiliation ?? "—")"
            publisherLabel.text = "Publisher: \(hero.biography?.publisher ?? "—")"
            
            let url = hero.images?.lg ?? hero.images?.md ?? hero.images?.sm
            ImageLoader.shared.loadImage(from: url) { [weak self] img in
                guard let self = self else { return }
                self.heroImageView.image = img ?? UIImage(named: "placeholder")
            }
        }
        
        private func showError(_ error: APIError) {
            let alert = UIAlertController(title: "Error",
                                          message: "Failed to load heroes. Please try again.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Retry", style: .default) { _ in
                self.loadAllHeroes()
            })
            present(alert, animated: true)
        }
    }
