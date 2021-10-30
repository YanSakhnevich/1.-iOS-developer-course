import UIKit

// MARK: Task1

// enum

enum Months {
    case january
    case fibrary
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
}

//class

class MuscleCar {
    var color = "yellow"
    var hoursePower = 1001
    var maxTorque = 1350
    
    func increaseHP () {
    }
}
var mustang: MuscleCar = MuscleCar()
print(mustang.color)


//struct

struct BasketballPlayer {
    var name: String
    var height: Int
    var weight: Int
    var skills: String
    init (name: String, height: Int, weight: Int, skills: String) {
        self.name = name
        self.height = height
        self.weight = weight
        self.skills = skills
    }
}
var player = BasketballPlayer(name: "Lebron", height: 205, weight: 100, skills: "Forward")
print(player.name, player.height, player.weight, player.skills)

//protocol

protocol Models {
    var kia: String { get }
    var hyundai: String { get }
}

struct Cars : Models {
    var kia: String
    
    var hyundai: String
    
}

let myCar = Cars(kia: "Rio", hyundai: "Creta")

print(myCar.kia, myCar.hyundai)



//MARK: Task2


//Композиция

/*  Пример 1. Университет и факультеты. Факультеты без университета жить не могут.
    Пример 2. Состав воды. Как известно, формула воды - Н2О. И вода не может существовать без кислорода, потому как вода без кислорода это водород.
 */

//Агрегация

/*  Пример 1. Профессор и университет. Если его уволят с универа, то он останется со своим званием профессора.
    Пример 2. Дом и его жильцы. Если все жильцы переедут в другой дом, то фактически старый дом будет в статусе дома (может в нем организуют площадку для страйкбола:) )
 */
