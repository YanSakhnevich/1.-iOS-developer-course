import UIKit

// MARK: Task1

let salaryOfFirstEmployee = 110000
let salaryOfSecondEmployee = 55000
let salaryOfThirdEmployee = 70000

// 1.1

salaryOfFirstEmployee > salaryOfThirdEmployee ? print("Salary of first employee greater than third employee") : print("Salary of third employee greater than first employee")
//1.2

salaryOfSecondEmployee < salaryOfFirstEmployee ? print("Salary of second employee less than first employee") : print("Salary of second employee greater than first employee")
//1.3

if salaryOfFirstEmployee > salaryOfSecondEmployee || salaryOfThirdEmployee < salaryOfSecondEmployee {
  print("If at least one of the conditions is true, print this")
} else {
  print("Both conditions are false")
}

//1.4
if salaryOfThirdEmployee < salaryOfFirstEmployee && salaryOfSecondEmployee > salaryOfFirstEmployee {
  print("If all conditions are true, print this")
} else {
  print("At least one condition was false")
}

// MARK: Task2

var a = 8
var b = 4
var c = 2
var d = b * b - 4 * a * c

// 2.1
if d > 0 {
  print ("The chart will most likely continue the direction")
} else {
  if d < 0 {
  print ("The chart is likely to change direction")
  } else {
    print ("Uncertain situation - you have to wait")
  }
}

//2.2
d == 0 ? print ("Uncertain situation - you have to wait") : (d > 0 ? print ("The chart will most likely continue the direction") : print ("The chart is likely to change direction"))

//2.3
switch d {
  case 1... :
  print ("The chart will most likely continue the direction")
  case ..<0 :
  print ("The chart is likely to change direction")
  default :
  print ("Uncertain situation - you have to wait")
}

// MARK: Task3

var isMale = true
var age = 17

switch age {
  case 3...17 :
  isMale ? print ("Children's content for boys") : print("Children's content for girls")
  case 18...65 :
  isMale ? print ("Adult content for men") : print("Adult content for women")
  case 66... :
  isMale ? print ("Content for older men") : print("Content for older women")
  default : print ("No matching content")
}

