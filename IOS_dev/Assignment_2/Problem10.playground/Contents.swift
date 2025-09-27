import Cocoa

var greeting = "Hello, playground"

func hasUniqueCharacters(_ text: String) -> Bool {
    var res: Bool = true
    var c: Int  = 0
    let chars = Array(text)
    for i in stride(from: 0, through: chars.count-1, by:1){
        for j in stride(from: i+1, through: chars.count-1, by:1){
            if chars[i] == chars[j]{
                c+=1
            }
        }
    }
    if(c>0){
        res = false
    }
    return res
}

print(hasUniqueCharacters("Helo"))
print(hasUniqueCharacters(greeting))
print(hasUniqueCharacters("AaBb"))
