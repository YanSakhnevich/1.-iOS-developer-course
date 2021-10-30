import UIKit

// MARK: Task1

/*
 Класс: кафе

 Имеет публичный доступ, так как любой может воспользоваться отдельным экземпляром (объектом) кафе.

 Пример геттера: узнать цену флет-уайта

 Пример сеттера: указать, что в кофе нужно добавить корицу

 Пример публичного метода: заказать кленовый пекан

 Пример приватного метода: узнать закупочную стоимость кофейных зерен
 
 */


// MARK: Task2

class Computation {
    func sum(_ x: Int, _ y : Int) -> Int{
        return x + y
    }
    func sum(_ x: Int, _ y : Int) -> Double{
        return 2 * Double(x + y)
    }
    func sum(_ x: Int, _ y: Int, _ z: Int ){
        print(x + y + z)
    }
}


let a: Int = Computation().sum(1, 2)
let b: Double = Computation().sum(1, 2)
Computation().sum(1, 2, 3)



// MARK: Task3

class BasketballPlayer {
    var height = 6.6
  var description: String {
    return " имеет рост \(height) ft."
  }
  func doesDribbling() {
  }
}

class Lebron: BasketballPlayer {
  var leftHanded = false
    override func doesDribbling() {
       print("Этот игрок имеет отличный дрибблинг")
    }
}

Lebron().doesDribbling()
