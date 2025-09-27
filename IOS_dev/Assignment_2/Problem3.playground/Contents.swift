import Cocoa

var greeting = "Hello, playground"

// conversion functions
func celsiusToFahrenheit(_ c: Double) -> Double {
    return (c * 9/5) + 32
}

func celsiusToKelvin(_ c: Double) -> Double {
    return c + 273.15
}

func fahrenheitToCelsius(_ f: Double) -> Double {
    return (f - 32) * 5/9
}

func fahrenheitToKelvin(_ f: Double) -> Double {
    return (f - 32) * 5/9 + 273.15
}

func kelvinToCelsius(_ k: Double) -> Double {
    return k - 273.15
}

func kelvinToFahrenheit(_ k: Double) -> Double {
    return (k - 273.15) * 9/5 + 32
}

//hardcode
let temp1 = 25.0
let unit1 = "C"

let temp2 = 100.0
let unit2 = "F"

let temp3 = 300.0
let unit3 = "K"

// main func
func convert(temp: Double, unit: String) {
    if unit.uppercased() == "C" {
        print("\(temp)°C = \(celsiusToFahrenheit(temp))°F, \(celsiusToKelvin(temp))K")
    } else if unit.uppercased() == "F" {
        print("\(temp)°F = \(fahrenheitToCelsius(temp))°C, \(fahrenheitToKelvin(temp))K")
    } else if unit.uppercased() == "K" {
        print("\(temp)K = \(kelvinToCelsius(temp))°C, \(kelvinToFahrenheit(temp))°F")
    } else {
        print("Unknown unit!")
    }
}

convert(temp: temp1, unit: unit1)
convert(temp: temp2, unit: unit2)
convert(temp: temp3, unit: unit3)
