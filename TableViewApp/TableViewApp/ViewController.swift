//
//  ViewController.swift
//  TableViewApp
//
//  Created by Verena Gaaze on 14.11.2025.
//

import UIKit

final class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    private var data: [[FavoriteItem]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Favorites"
        setupTableView()
        loadSampleData()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func loadSampleData() {
        let movies: [FavoriteItem] = [
            FavoriteItem(imageName: "whiplash", title: "Whiplash", subtitle: "Damien Chazelle, 2014", review: "Love the atmosphere, dark New York and prestigious music academy. Very stressful and relatable movie."),
            FavoriteItem(imageName: "trial", title: "Trial Of the Chicago 7", subtitle: "Aaron Sorkin, 2020", review: "I admire that fact that the country could make a movie about its faulire and openly admit it. A very moving and emotional film about the war."),
            FavoriteItem(imageName: "oppenheimer", title: "Oppenheimer", subtitle: "Christopher Nolan, 2023", review: "Nolan is genuis. Emotionally powerful and scientifically intriguing; the soundtrack and visuals stay with me."),
            FavoriteItem(imageName: "seven", title: "Seven", subtitle: "David Fincher, 1995", review: "Best truecrime film ever. The terrifying thriller with strong discomfort to watch, and a great cast."),
            FavoriteItem(imageName: "backdown", title: "Never Back Down", subtitle: "Jeff Wadlow, 2008", review: "Although it is cliche and there are a lot of movies with the same idea, I think this one is the best in its genre.")
        ]

        let music: [FavoriteItem] = [
            FavoriteItem(imageName: "ScaledAndIcy" , title: "Scaled And Icy", subtitle: "21 Pilots, 2021", review: "A colorful, upbeat contrast to previous albums, featuring 'Shy Away' and 'Saturday'. Recorded remotely during the pandemic."),
            FavoriteItem(imageName: "Vessel", title: "Vessel", subtitle: "21 Pilots, 2013", review: "Includes re-recordings of songs from 'Regional at Best' like 'Car Radio' and 'Holding on to You'. Marked their first major label debut."),
            FavoriteItem(imageName: "Breach", title: "Breach", subtitle: "21 Pilots, 2025", review: "A follow-up to the duo's previous album Clancy, and concludes a conceptual series also consisting of Blurryface, Trench, and Scaled and Icy."),
            FavoriteItem(imageName: "SelfTitled", title: "Twenty One Pilots", subtitle: "21 Pilots, 2009", review: "Debut album from 2009 — self-produced by the band. Features raw, piano-driven tracks that introduced their signature sound."),
            FavoriteItem(imageName: "RegionalAtBest", title: "Regional At Best", subtitle: "21 Pilots, 2011", review: "An independent release showcasing early versions of fan-favorites. Rare physical copies are highly sought after.")
        ]

        let books: [FavoriteItem] = [
            FavoriteItem(imageName: "mindhunter", title: "MindHunter", subtitle: "John Duglas", review: "In my opinion the best truecrime related book in the world. It is written by a former FBI Agent who was a co-founder of Behavioral Analysis Unit. In this book he talks about famous serial killers and how the think."),
            FavoriteItem(imageName: "sapiens", title: "Sapiens", subtitle: "Yuval Noah Harari", review: "The best book when it comes to world history. I have learnt a lot of meaningful things about our species and how we created this world that we live in."),
            FavoriteItem(imageName: "theory", title: "Theory of Everything", subtitle: "Stephen Hawking", review: "Famous scientific book from one of the best scientist of our time. It abstractly tells about the history of the universe, what are black wholes and the most popular theory how world is arranged - string theory"),
            FavoriteItem(imageName: "cleanCoder", title: "The Clean Coder", subtitle: "Robert Martin", review: "In this book legendary software expert Robert Martin introduces the disciplines, techniques, tools, and practices of true software craftsmanship. It helped me a lot during my study."),
            FavoriteItem(imageName: "foxhole", title: "The Foxhole Court", subtitle: "Nora Sakavic", review: "My favorite fiction book, the first book in the All For The Game thrilogy. Talks about the fictional sport named exy.")
        ]

        let courses: [FavoriteItem] = [
            FavoriteItem(
                imageName: "ios",
                title: "iOS Development",
                subtitle: "year 4",
                review: "Best course ever!!! Studied Swift, UIKit, and building fully functional mobile apps from scratch. This course helped me confidently create real-world iOS applications with clean architecture."
            ),
            FavoriteItem(
                imageName: "iml",
                title: "Intro Machine Learning",
                subtitle: "year 3",
                review: "Learned core ML concepts, model training, and evaluating simple classifiers. It strengthened my understanding of data-driven decision-making and applied analytics."
            ),
            FavoriteItem(
                imageName: "java",
                title: "Java Spring Boot Framework",
                subtitle: "year 3",
                review: "Studied backend development, REST APIs, security, and working with databases using Spring Boot. It gave me practical skills to build scalable server-side applications."
            ),
            FavoriteItem(
                imageName: "oop",
                title: "Object Oriented Programming",
                subtitle: "year 2",
                review: "Learned the principles of classes, inheritance, encapsulation, and clean design patterns. This course shaped how I structure all my code and think about architecture."
            ),
            FavoriteItem(
                imageName: "pp1",
                title: "Programming Principles 1",
                subtitle: "year 1",
                review: "Learned basic programming concepts, problem-solving, and writing clean, logical code. It built the foundation for every advanced course I took later."
            )
        ]

        data = [movies, music, books, courses]
        tableView.reloadData()
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCell
        let item = data[indexPath.section][indexPath.row]
        cell.configure(with: item)
        cell.selectionStyle = .none
        return cell
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sec = FavoriteSection(rawValue: section) else { return nil }
        let header = SectionHeaderView(title: sec.title, emoji: sec.emoji)
        header.translatesAutoresizingMaskIntoConstraints = false

        let container = UIView()
        container.backgroundColor = .clear
        container.addSubview(header)
        NSLayoutConstraint.activate([
            header.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 12),
            header.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12),
            header.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
            header.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -4)
        ])
        return container
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 56
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
