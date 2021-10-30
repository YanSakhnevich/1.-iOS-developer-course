import UIKit

// MARK: Task1

// 1.1
var value1: String? = "12"
var value2: String? = "five5"
var value3: String?

let printValue1 = value1 ?? "The value is nil"
let printValue2 = value2 ?? "The value is nil"
let printValue3 = value3 ?? "The value is nil"

print(printValue1)
print(printValue2)
print(printValue3)

value3 = value2
let printValue4 = value3 ?? "The value is nil"
print(printValue4)

//1.2
let a = "324"
let b = "fdsf3"
let c = "32342"
let d = "ff66"
let e = "4343344"

// Forced Unwrapping
var forcedUnwrappingSum = 0

if Int(a) != nil {
  forcedUnwrappingSum += Int(a)!
}
if Int(b) != nil {
  forcedUnwrappingSum += Int(b)!
}
if Int(c) != nil {
  forcedUnwrappingSum += Int(c)!
}
if Int(d) != nil {
  forcedUnwrappingSum += Int(d)!
}
if Int(e) != nil {
  forcedUnwrappingSum += Int(e)!
}
print("The sum of all variables Int = \(forcedUnwrappingSum)")

// Optional Binding
var optionalBindingSum = 0

if let a = Int(a) {
  optionalBindingSum += a
}
if let b = Int(b) {
  optionalBindingSum += b
}
if let c = Int(c) {
  optionalBindingSum += c
}
if let d = Int(d) {
  optionalBindingSum += d
}
if let e = Int(e) {
  optionalBindingSum += e
}
print("The sum of all variables Int = \(optionalBindingSum)")


// MARK: Task2

let optSomeValue: Int? = Int ("a15")

if optSomeValue == nil{
  print("Dude, I can't understand what you wrote")
} else if 0...10 ~= optSomeValue! {
  print("Finally, you can take off your fur coat, because the temperature is \(optSomeValue!) degrees Celsius")
} else if -10...(-1) ~= optSomeValue! {
  print("It's getting colder, it's time to get dressed, the temperature has dropped below freezing and equal \(optSomeValue!) degrees Celsius")
} else if optSomeValue! < -10 {
  print("The temperature dropped below -10 degrees Celsius and equal \(optSomeValue!), it's time to go home!")
} else if optSomeValue! > 10 {
  print("The temperature is above 10 degrees Celsius and equal \(optSomeValue!), we are going to the sea")
}

