# Advanced Hero App

The **Advanced Hero App** is an iOS application that displays detailed information about superheroes using data from the public **SuperHero API**.  
This lab focuses on model structuring, networking with **Alamofire**, image loading with **Kingfisher**, persistent storage, and clean UI layout with stack views.

## App Description

The app fetches superhero data from the API and displays:

- Hero name  
- Real/full name  
- Appearance details (gender, height, weight)  
- Power stats (intelligence, speed, power, etc.)  
- Biography & alignment  
- Occupation  
- Group affiliations  
- Publisher  
- Hero image (large/medium/small depending on API availability)

A **Randomize** button loads a new random hero.

The app also **remembers the last displayed hero** and restores it after the app restarts (using `UserDefaults`).

This project expands on the earlier “Hero Randomizer App” by adding:
- rich models,
- image loading libraries,
- persistent state,
- clean architecture,
- and stable API integration.

## Features Implemented

- **Swift Package Manager** integration  
- **Alamofire** for networking  
- **Kingfisher** for image downloading + caching  
- **Codable** for decoding nested JSON structures  
- Persistent storage of "last shown hero" using `UserDefaults`  
- UI built with **storyboard + stack views**  
- Smooth crossfade animation when randomizing heroes  
- Clear MVC structure  
- Full error handling (alerts + retry)

## How to Run the Project

1. Clone or download the project.  
2. Open `AdvancedHeroApp.xcodeproj` in Xcode.  
3. Wait for Swift Packages to resolve automatically.  
4. Make sure the target is set to an **iOS Simulator (iOS 17+)**.  
5. Press **⌘ + R** to build and run the project.


## Dependencies

### **Alamofire**
Used for downloading the JSON from the API.

Added via Swift Package Manager: [alamofire](https://github.com/Alamofire/Alamofire)

### **Kingfisher**
Used for async image loading, caching, and fade animations.

Added via Swift Package Manager:  [kingfisher](https://github.com/onevcat/Kingfisher)