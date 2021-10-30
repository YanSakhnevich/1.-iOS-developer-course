import UIKit


// MARK: Task1

let boysArray = ["Oleg", "Gleb"]
let girlsArray = ["Alina", "Lena", "Olga"]
var studentsArray = [String]()
studentsArray = girlsArray

// Способ, который необходимо реализовать по ДЗ
for (index, name) in boysArray.enumerated() {
  studentsArray.insert(name, at: index)
}
// Более красивый способ
studentsArray = girlsArray // Возвращаю массив студентов к первоначальному виду
studentsArray.insert(contentsOf: boysArray, at: 0)


// MARK: Task2

// Первый способ
studentsArray.sort()
print(studentsArray)

//Второй способ
let sortedStudentsArray = studentsArray.sorted()
print(sortedStudentsArray)


// MARK: Task3

var valuesArray = [1,-5,8,54,-85,-42,1,12,31,445,66,-998,-54,-569,448]

// Сортировка от большего к меньшему с созданием нового массива
let sortedValuesArray = valuesArray.sorted(by: >)
print(sortedValuesArray)

// Сортировка от большего к меньшему с изменением текущего массива
var valuesArray1 = [1,-5,8,54,-85,-42,1,12,31,445,66,-998,-54,-569,448] // Объявим новый массив, для примера
valuesArray1.sort(by: {$1 < $0})
print(valuesArray1)

// Фильтрация массива посредством удаления отрицательных элементов способ 1
var filteredArray = [Int]()
for value in valuesArray {
  if value > 0 {
    filteredArray.insert(value, at: 0)
  }
}
print(filteredArray)

// Фильтрация массива посредством удаления отрицательных элементов способ 2

let filteredArray1 = valuesArray.filter({$0 > 0})
print(filteredArray1)


// MARK: Task4

var someArray =  [1, 2, 3, 4, 7, 8, 15]
let sumValue = 6
var count = 0
var indexArray = [Int]()

for i in 0...someArray.count-1 {
  for j in i...someArray.count-1 {
    if (someArray[i] + someArray[j] == sumValue) && i != j {
      count+=1
      indexArray.insert(i, at: count-1)
      indexArray.insert(j, at: count)
      print("[\(indexArray[count-1]), \(indexArray[count])]")
    }
  }
}
if indexArray.isEmpty {
  print("This array did not contain a pair of numbers, the sum of which is \(sumValue)")
}

