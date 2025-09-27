import Cocoa

var greeting = "Hello, playground"

let students: [String: Int] = [
    "Verena": 85,
    "Gaaze": 72,
    "Name": 50,
]

// Step 1: Extract scores
let scores = Array(students.values)

// Step 2: Calculate average
let average = Double(scores.reduce(0, +)) / Double(scores.count)

// Step 3: Find highest and lowest
if let highest = scores.max(), let lowest = scores.min() {
    print("Grade Report")
    print("Average score: \(average)")
    print("Highest score: \(highest)")
    print("Lowest score: \(lowest)")
    print("")

// Step 4: Show each student with comparison
    for (name, score) in students {
        if Double(score) > average {
            print("\(name): \(score) Above average")
        } else if Double(score) < average {
            print("\(name): \(score) Below average")
        } else {
            print("\(name): \(score) Exactly average")
        }
    }
}
