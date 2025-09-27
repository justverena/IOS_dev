import Cocoa

var greeting = "Hello, playground"

var shoppingList: [String] = []

// user inputs
let simulatedInputs = [
    "1", "Apples",
    "1", "Bananas",
    "3",
    "2", "Apples",
    "3",
    "4"
]

var inputIndex = 0

@MainActor func getInput() -> String {
    defer { inputIndex += 1 }
    return simulatedInputs[inputIndex]
}

var isRunning = true

while isRunning {
    print("""
    \n Shopping List Manager
    1. Add item
    2. Remove item
    3. View list
    4. Exit
    Choose an option:
    """)

    let choice = getInput()

    switch choice {
    case "1":
        print("Enter item to add:")
        let item = getInput()
        shoppingList.append(item)
        print("\(item) added to the list.")
    case "2":
        print("Enter item to remove:")
        let item = getInput()
        if let index = shoppingList.firstIndex(of: item) {
            shoppingList.remove(at: index)
            print("\(item) removed from the list.")
        } else {
            print("\(item) not found in the list.")
        }
    case "3":
        print("Current Shopping List:")
        if shoppingList.isEmpty {
            print("The list is empty.")
        } else {
            for (i, item) in shoppingList.enumerated() {
                print("\(i + 1). \(item)")
            }
        }
    case "4":
        print("Exiting Shopping List Manager. Goodbye!")
        isRunning = false
    default:
        print("Invalid option, try again.")
    }
}
