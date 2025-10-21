//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Verena Gaaze on 21.10.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    struct Item {
        let title: String
        let imageName: String
        let description: String
    }
    
    let items: [Item] = [
        Item(title: "Blurryface", imageName: "Blurryface", description: "Album released in 2015 — includes hits like 'Stressed Out' and 'Ride'."),
        Item(title: "Trench",  imageName: "Trench", description: "Album released in 2018 — a concept album about escaping the fictional city of Dema. Includes 'Jumpsuit', 'Nico and the Niners', and 'My Blood'."),
        Item(title: "Scaled and Icy",  imageName: "ScaledAndIcy", description:"Album released in 2021 — a colorful, upbeat contrast to previous albums, featuring 'Shy Away' and 'Saturday'. Recorded remotely during the pandemic."),
        Item(title: "Vessel",  imageName: "Vessel", description: "Album released in 2013 — includes re-recordings of songs from 'Regional at Best' like 'Car Radio' and 'Holding on to You'. Marked their first major label debut."),
        Item(title: "Regional at Best",  imageName: "RegionalAtBest", description: "Album released in 2011 — an independent release showcasing early versions of fan-favorites. Rare physical copies are highly sought after."),
        Item(title: "Twenty One Pilots",  imageName: "SelfTitled", description: "Debut album from 2009 — self-produced by the band. Features raw, piano-driven tracks that introduced their signature sound."),
        Item(title: "Heathens",  imageName: "Heathens", description: "Single from 2016 — created for the 'Suicide Squad' soundtrack. Blends eerie vibes with the duo’s signature dark-pop style."),
        Item(title: "Clancy",  imageName: "Clancy", description: "Album released in 2024 — concludes the Dema storyline started in 'Trench'. Includes 'Overcompensate' and 'Next Semester'."),
        Item(title: "Breach",  imageName: "Breach", description: "Album released in 2025 — a follow-up to the duo's previous album Clancy, and concludes a conceptual series also consisting of Blurryface, Trench, and Scaled and Icy."),
        Item(title: "MTV Unplugged",  imageName: "MtvUnplugged", description: "Live performance album released in 2022 — features stripped-down, reimagined versions of their biggest hits."),
        Item(title: "Cancer",  imageName: "Cancer", description: "Single, Cover of My Chemical Romance’s 'Cancer' (2016) — deeply emotional rendition with electronic undertones."),
        Item(title: "Doubt (Demo)",  imageName: "DoubtDemo", description: "Single,  previously unreleased demo version of 'Doubt' from the Blurryface era — raw and minimalist, showcasing early production ideas."),
        Item(title: "CStY",  imageName: "ChristmasSavesTheYear", description: "Single, Released in 2020 — a heartfelt Christmas single written during lockdown. Reflective, hopeful, and personal."),
        Item(title: "Level of Concern",  imageName: "LevelOfConcern", description: "Single, Released in 2020 — an upbeat quarantine anthem encouraging optimism. The band even launched an interactive fan server around it.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomizeCover()
    }

    @IBAction func randomizePressed(_ sender: UIButton) {
        randomizeCover()
    }
    
    private func randomizeCover() {
        guard let randomItem = items.randomElement() else { return }

        titleLabel.text = randomItem.title
        descriptionLabel.text = randomItem.description
        coverImageView.image = UIImage(named: randomItem.imageName)
    }
}
