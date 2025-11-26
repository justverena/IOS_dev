//
//  Data.swift
//  FavoriteManagerApp
//
//  Created by Verena Gaaze on 22.11.2025.
//
let movies: [FavoriteItem] = [
    FavoriteItem(imageName: "whiplash", title: "Whiplash", description: "Damien Chazelle, 2014. A young jazz drummer enrolls at a competitive music academy where his talent is challenged by a demanding teacher.", review: "Love the atmosphere, dark New York and prestigious music academy. Very stressful and relatable movie."),
    FavoriteItem(imageName: "trial", title: "Trial Of the Chicago 7", description: "Aaron Sorkin, 2020. True story of seven anti-Vietnam War protestors charged with conspiracy and crossing state lines.", review: "I admire that fact that the country could make a movie about its failure and openly admit it. Emotional and moving."),
    FavoriteItem(imageName: "oppenheimer", title: "Oppenheimer", description: "Christopher Nolan, 2023. Biography of the physicist behind the atomic bomb and the moral dilemmas of scientific discovery.", review: "Nolan is genius. Emotionally powerful and scientifically intriguing; the soundtrack and visuals stay with me."),
    FavoriteItem(imageName: "seven", title: "Seven", description: "David Fincher, 1995. Two detectives hunt a serial killer who uses the seven deadly sins as his motives.", review: "Best true crime film ever. The thriller is intense and discomforting, with a great cast."),
    FavoriteItem(imageName: "backdown", title: "Never Back Down", description: "Jeff Wadlow, 2008. Teen discovers mixed martial arts to fight against a bullying rival.", review: "Although cliche, this is the best in its genre."),
    FavoriteItem(imageName: "inception", title: "Inception", description: "Christopher Nolan, 2010. A thief steals information by entering dreams, facing complex layers of subconscious.", review: "Mind-bending visuals and smart storytelling. Always rewatchable."),
    FavoriteItem(imageName: "parasite", title: "Parasite", description: "Bong Joon-ho, 2019. Class struggle depicted through a poor family infiltrating a wealthy household.", review: "Brilliant social commentary with dark humor. Outstanding cinematography."),
    FavoriteItem(imageName: "joker", title: "Joker", description: "Todd Phillips, 2019. Origin story of the infamous DC villain in a society that ignores mental illness.", review: "Terrifying yet compelling. Joaquin Phoenix performance is unforgettable."),
    FavoriteItem(imageName: "shawshank", title: "Shawshank Redemption", description: "Frank Darabont, 1994. Story of hope and friendship in a brutal prison environment.", review: "Uplifting and emotional. Classic storytelling."),
    FavoriteItem(imageName: "madmax", title: "Mad Max: Fury Road", description: "George Miller, 2015. Post-apocalyptic road chase with incredible stunts.", review: "High-octane action with strong visuals and minimal dialogue. Pure adrenaline.")
]

let music: [FavoriteItem] = [
    FavoriteItem(imageName: "ScaledAndIcy" , title: "Scaled And Icy", description: "21 Pilots, 2021. Colorful, upbeat contrast to previous albums.", review: "Features 'Shy Away' and 'Saturday'. Recorded remotely during the pandemic."),
    FavoriteItem(imageName: "Vessel", title: "Vessel", description: "21 Pilots, 2013. First major label debut album.", review: "Includes re-recordings of songs from 'Regional at Best'. Great first introduction."),
    FavoriteItem(imageName: "Breach", title: "Breach", description: "21 Pilots, 2025. Concluding conceptual series of albums.", review: "Follows Clancy, Blurryface, Trench, and Scaled and Icy. Conceptually strong."),
    FavoriteItem(imageName: "SelfTitled", title: "Twenty One Pilots", description: "21 Pilots, 2009. Debut self-produced album.", review: "Raw, piano-driven tracks that introduced their signature sound."),
    FavoriteItem(imageName: "RegionalAtBest", title: "Regional At Best", description: "21 Pilots, 2011. Independent release.", review: "Showcases early versions of fan-favorites. Rare and special."),
    FavoriteItem(imageName: "Blurryface", title: "Blurryface", description: "21 Pilots, 2015. Third studio album.", review: "Explores themes of insecurity and self-doubt. Includes hits like 'Stressed Out'."),
    FavoriteItem(imageName: "Trench", title: "Trench", description: "21 Pilots, 2018. Concept album exploring mental health and resilience.", review: "Story-driven music with unique sound design. Very creative."),
    FavoriteItem(imageName: "VesselLive", title: "Vessel Live", description: "21 Pilots, 2014. Live album capturing concert energy.", review: "Energetic performances, great fan interaction."),
    FavoriteItem(imageName: "ScaledAndIcyDeluxe", title: "Scaled And Icy Deluxe", description: "21 Pilots, 2022. Deluxe edition of 2021 album.", review: "Bonus tracks and remixes included, fun to explore."),
    FavoriteItem(imageName: "TrenchSpecial", title: "Trench Special", description: "21 Pilots, 2019. Special edition releases with remixes.", review: "Interesting variations and deepens the story.")
]

let books: [FavoriteItem] = [
    FavoriteItem(imageName: "mindhunter", title: "MindHunter", description: "John Douglas. FBI profiler explores serial killers.", review: "Best true crime book. Insightful and detailed."),
    FavoriteItem(imageName: "sapiens", title: "Sapiens", description: "Yuval Noah Harari. History of humankind.", review: "Highly informative and thought-provoking."),
    FavoriteItem(imageName: "theory", title: "Theory of Everything", description: "Stephen Hawking. Explains universe and physics theories.", review: "Scientific yet readable. Excellent overview."),
    FavoriteItem(imageName: "cleanCoder", title: "The Clean Coder", description: "Robert Martin. Software craftsmanship guide.", review: "Essential for learning coding discipline."),
    FavoriteItem(imageName: "foxhole", title: "The Foxhole Court", description: "Nora Sakavic. First book in All For The Game.", review: "Engaging fiction and sports theme."),
    FavoriteItem(imageName: "dune", title: "Dune", description: "Frank Herbert. Epic sci-fi novel.", review: "Rich world-building and political intrigue."),
    FavoriteItem(imageName: "harrypotter", title: "Harry Potter", description: "J.K. Rowling. Wizarding school adventures.", review: "Magical and nostalgic. Great characters."),
    FavoriteItem(imageName: "hobbit", title: "The Hobbit", description: "J.R.R. Tolkien. Classic fantasy adventure.", review: "Timeless tale of courage and journey."),
    FavoriteItem(imageName: "foundation", title: "Foundation", description: "Isaac Asimov. Sci-fi epic about galactic empire.", review: "Intricate plot, highly influential."),
    FavoriteItem(imageName: "catch22", title: "Catch-22", description: "Joseph Heller. Satirical WWII novel.", review: "Darkly humorous and critical of bureaucracy.")
]

let courses: [FavoriteItem] = [
    FavoriteItem(imageName: "ios", title: "iOS Development", description: "Year 4. Swift and UIKit for real-world apps.", review: "Best course ever! Built fully functional apps with clean architecture."),
    FavoriteItem(imageName: "iml", title: "Intro Machine Learning", description: "Year 3. Core ML concepts and model training.", review: "Practical ML foundation, applied analytics."),
    FavoriteItem(imageName: "java", title: "Java Spring Boot Framework", description: "Year 3. Backend development and REST APIs.", review: "Gave practical skills for server-side apps."),
    FavoriteItem(imageName: "oop", title: "Object Oriented Programming", description: "Year 2. Classes, inheritance, encapsulation.", review: "Shaped my coding architecture and design thinking."),
    FavoriteItem(imageName: "pp1", title: "Programming Principles 1", description: "Year 1. Basics of programming and logic.", review: "Built strong foundation for future courses."),
    FavoriteItem(imageName: "highload", title: "Highload Backend", description: "Year 4. Python Django, caching, concurrency, Redis and Rabbit MQ.", review: "Writing Backend for highloaded services. Build robust, maintanable code."),
    FavoriteItem(imageName: "dl", title: "Deep learning", description: "Year 4. ML and Fundamentals of DL.", review: "Introduced intelligent systems and logic."),
    FavoriteItem(imageName: "algo", title: "Algorithms", description: "Year 2. Sorting, searching, complexity.", review: "Taught problem-solving and optimization."),
    FavoriteItem(imageName: "webdev", title: "Web Development", description: "Year 2. HTML, CSS, JS, React Django basics.", review: "Practical skills for frontend and fullstack."),
    FavoriteItem(imageName: "databases", title: "Databases", description: "Year 2. SQL, data modeling, relations.", review: "Crucial for backend understanding.")
]
