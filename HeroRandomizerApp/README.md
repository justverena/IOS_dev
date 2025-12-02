# Hero Randomizer App

## Description
The **Hero Randomizer App** is a simple iOS application built in **Swift** using **UIKit**.  
It fetches superhero data from a public API and displays a **random hero** each time the user taps the **Randomize** button.  
The app shows the hero’s image, biography details, power statistics, and appearance information — all updated with a smooth animated transition.

## Tasks Completed

### API Integration
Integrated the real **Superhero API**:  
`https://akabab.github.io/superhero-api/api/all.json`  
- Decoded hero powerstats, biography, appearance, connections, and images  
- Random element selection to display a new hero on each tap

### Image Loading & Caching
Built a small `ImageLoader` utility:
- Asynchronously loads hero images  
- Caches downloaded images  
- Improves performance and eliminates repeated requests

### Bonus: Transition Animation
Implemented a full-screen **transition animation** when switching between heroes:
- Smooth crossfade or slide-in animation  
- Gives the effect of navigating to a new screen while staying in the same ViewController

## How It Works
1. App loads all superheroes via the API on launch  
2. Stores them in memory  
3. When the user taps **Randomize**, the app:
   - Chooses a random hero  
   - Loads the hero’s image from the API  
   - Updates all labels  
   - Plays a transition animation  

## Technologies Used
- **Swift**  
- **UIKit**  
- **URLSession** (networking)  
- **Codable** (JSON parsing)  
- **Storyboard + Auto Layout + UIStackView**  
- **Core Animation / UIView Transitions**  