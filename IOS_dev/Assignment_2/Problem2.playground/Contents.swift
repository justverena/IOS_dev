import Cocoa

var greeting = "Hello, playground"

func isPrime(_number: Int) -> Bool {
    var res = false
    if _number % 2 == 0 {
        res = true
    }
    return res
}
for i in 1...100{
    if isPrime(_number: i) == true {
        print(i)
    }
}
