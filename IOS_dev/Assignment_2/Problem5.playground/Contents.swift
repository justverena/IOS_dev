import Cocoa

var greeting = "Hello, playground"

let sentence = "Hello, hello! This is a test. A simple test, hello world."

let lowercased = sentence.lowercased()
let cleaned = lowercased.components(separatedBy: CharacterSet.punctuationCharacters).joined()

let words = cleaned.components(separatedBy: CharacterSet.whitespacesAndNewlines).filter { !$0.isEmpty }

var frequency: [String: Int] = [:]

for word in words {
    frequency[word, default: 0] += 1
}

print("Word Frequencies:")
for (word, count) in frequency {
    print("\(word): \(count)")
}
