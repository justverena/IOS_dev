import Cocoa

var greeting = "Hello, playground"

func isPalindrome(_ text: String) -> Bool {
    let cleaned = text.lowercased().filter { $0.isLetter || $0.isNumber }
    let chars = Array(cleaned)
    
    var left = 0
    var right = chars.count - 1
    
    while left < right {
        if chars[left] != chars[right] {
            return false
        }
        left += 1
        right -= 1
    }
    return true
}
print(isPalindrome(greeting))
print(isPalindrome("mom"))
print(isPalindrome("elle"))
print(isPalindrome("Hello"))
