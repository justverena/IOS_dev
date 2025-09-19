import Cocoa

var greeting = "Hello, playground"

//Step1

let lastName : String = "Gaaze"
let firstName : String = "Verena"
let birthYear : Int = 2005
let currentYear : Int = 2025
let age : Int = currentYear - birthYear
let isStudent : Bool = true
let height : Double = 1.70

//Step2

let hobby : String = "reading truecrime"
let NumberOFHobbies : Int = 10
let favouriteNumber : Int = 3
let isHobbyCreative : Bool = false

func isStudentAnswer() -> String {
    if isStudent{
        "a student"
    } else {
        "not a student"
    }
}

func isHobbyCreativeAnswer() -> String {
    if isHobbyCreative{
        "very creative"
    } else {
        "not very creative"
    }
}

//Step3
var lifeStory : String = """
My name is \(firstName) \(lastName) and I am \(age) years old, born in \(birthYear). I am \(isStudentAnswer()). I like \(hobby), but it is \(isHobbyCreativeAnswer()). I have \(NumberOFHobbies) and my favourite number is \(favouriteNumber).
"""
//Bonus
let futureGoals : String = " In near future I want to graduate from KBTU and find a good job 🎉"

//Step 4
lifeStory.append(futureGoals)
print(lifeStory)

