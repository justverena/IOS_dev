import Cocoa

var greeting = "Hello, playground"

// Srep 1: Creating functions for operations
func addition(_a : Double, _b: Double) -> Double {
    let _c = _a + _b
    return _c
}
func subtraction(_a: Double, _b : Double) -> Double{
    let _c = _a - _b
    return _c
}
func multiplication(_a: Double, _b : Double) -> Double{
    let _c = _a * _b
    return _c
}
func division(_a: Double, _b : Double) -> Double? {
    return _b == 0 ? nil : _a / _b
}
// Step 2: Getting input
let simulatedInputs: [(Double, Double, String)] = [
    (10, 5, "+"),
    (10, 5, "-"),
    (10, 5, "*"),
    (10, 0, "/"),
    (20, 4, "/")
]

print("""
\n Calculator
+: Addition
-: Subtraction
*: Multiplication
/: Division
Choose an option:
""")
//Step 3: Main function
for (a, b, op) in simulatedInputs {
    var result: String
    
    switch op {
    case "+":
        result = "\(a) + \(b) = \(addition(_a: a, _b: b))"
    case "-":
        result = "\(a) - \(b) = \(subtraction(_a: a, _b: b))"
    case "*":
        result = "\(a) * \(b) = \(multiplication(_a: a, _b: b))"
    case "/":
        if let res = division(_a: a, _b: b) {
            result = "\(a) / \(b) = \(res)"
        } else {
            result = "Error: Division by zero"
        }
    default:
        result = "Invalid operation"
    }
    
    print(result)
}
