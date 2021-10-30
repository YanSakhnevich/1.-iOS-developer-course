import UIKit

//MARK: Part1
/*
 Для начала нужно описать машину минимальным набором параметров, используя протокол.

 Алгоритм выполнения:
 1.Создайте протокол 'Car'
 2.Добавьте в него свойства:
 - 'model' (только для чтения): марка
 - 'color' (только для чтения): цвет
 - 'buildDate' (только для чтения): дата выпуска
 - 'price' (чтение и запись): цена авто
 - 'accessories' (чтение и запись): дополнительное оборудование (тонировка, сингнализация, спортивные диски)
 - 'isServiced' (чтение и запись): сделана ли предпродажная подготовка. Обычно ее делают в дилерских центрах перед постановкой машины в салон.
 */

enum Accessories {
    case securitySystem, anticorrosive, antiNoise, fenders, rugs, toning, parkingSensors, visor, alarmSystem, firstAidKit
}

protocol CarProtocol {
    var model: String {get}
    var color: String {get}
    var buildDate: Int {get}
    var price: Int {get set}
    var accessories: [Accessories] {get set}
    var isServiced: Bool {get set}
    var vin: Int {get}
    var isSpecialOffer: Bool {get set}
    
}


//MARK: Part2
/*
 По аналогии с протоколом 'Car', нужно описать дилерский центр минимальным набором свойств и методов, используя протокол.

 Алгоритм выполнения:
 1. Создайте протокол 'Dealership'
 2. Добавьте свойства:
 - 'name' (только для чтения): название дилерского центра (назвать по марке машины для упрощения)
 - 'showroomCapacity' (только для чтения): максимальная вместимость автосалона по количеству машин.
 - 'stockCars' (массив, чтение и запись): машины, находящиеся на парковке склада. Представим, что парковка не имеет лимита по количеству машин.
 - 'showroomCars' (массив, чтение и запись): машины, находящиеся в автосалоне.
 - 'cars' (массив, чтение и запись): хранит список всех машин в наличии.
 3. Добавьте методы:
 - 'offerAccesories(_ :)': принимает массив акксесуаров в качестве параметра. Метод предлагает клиенту купить доп. оборудование.
 - 'presaleService(_ :)': принимает машину в качестве параметра. Метод отправляет машину на предпродажную подготовку.
 - 'addToShowroom(_ :)': также принимает машину в качестве параметра. Метод перегоняет машину с парковки склада в автосалон, при этом выполняет предпродажную подготовку.
 - 'sellCar(_ :)': также принимает машину в качестве параметра. Метод продает машину из автосалона при этом проверяет, выполнена ли предпродажная подготовка. Также, если у машины отсутсвует доп. оборудование, нужно предложить клиенту его купить. (давайте представим, что клиент всегда соглашается и покупает :) )
 - 'orderCar()': не принимает и не возвращает параметры. Метод делает заказ новой машины с завода, т.е. добавляет машину на парковку склада.
 */

protocol Dealership {
    var name: String {get}
    var showroomCapacity: Int {get}
    var stockCars: [CarProtocol] {get set}
    var showroomCars: [CarProtocol] {get set}
    var cars: [CarProtocol] {get set}
    func offerAccesories(accessories : [Accessories])
    func presaleService(car : inout CarProtocol)
    func addToShowroom(car : CarProtocol)
    func sellCar(car : inout CarProtocol, acces: [Accessories])
    func orderCar(car: CarProtocol) // Принято решение, что данный метод принимает параметр car: CarProtocol (описывает новую машину, которая была заказана с завода), так как по заданию, после выполнения этого метода, заказанная машина с завода  должна поступить на стоянку диллера.
    func fromStockToShowroom(car: CarProtocol) throws //метод, позволяющий перегнать авто из склада в шоурум (для полноты картины :) )
}

//MARK: Part3
/*
 Настало время добавить классы и структуры, реализующие созданные ранее протоколы.

 Алгоритм выполнения:
 1. Используя структуры, создайте несколько машин разных марок (например BMW, Honda, Audi, Lexus, Volvo). Все они должны реализовать протокол 'Car'.
 2. Используя классы, создайте пять различных дилерских центров (например BMW, Honda, Audi, Lexus, Volvo). Все они должны реализовать протокол 'Dealership'. Каждому дилерскому центру добавьте машин на парковку и в автосалон (используйте те машины, которые создали ранее).
 3. Создайте массив, положите в него созданные дилерские центры. Пройдитесь по нему циклом и выведите в консоль слоган для каждого дилеского центра (слоган можно загуглить).
 */

struct ModelCar: CarProtocol{
    var model: String
    var color: String
    var buildDate: Int
    var price: Int
    var accessories = [Accessories]()
    var isServiced: Bool
    var vin: Int
    var isSpecialOffer: Bool = false
}

class Dealer : Dealership, SpecialOffer {
    
    var name: String
    var showroomCapacity: Int
    var stockCars = [CarProtocol]()
    var showroomCars = [CarProtocol]()
    var cars = [CarProtocol]()
    
    init(showroomCapacity: Int, name: String) {
        self.showroomCapacity = showroomCapacity
        self.name = name
    }
    func offerAccesories(accessories: [Accessories]) {
        print("We will acquaint you with the list of accessories:")
        for i in accessories {
            print(i)
        }
    }
    func presaleService(car: inout CarProtocol) {
        car.isServiced.toggle()
        print("Car \(name) \(car.model), vin \(car.vin), \(car.color) color, build date: \(car.buildDate) with price \(car.price)$ was sended to presale service.")
    }
    func addToShowroom(car: CarProtocol) {
        if showroomCars.count <= showroomCapacity-1 {
            showroomCars.append(car)
            cars.append(car)
            print("Car \(name) \(car.model), vin \(car.vin), \(car.color) color, build date: \(car.buildDate) with price \(car.price)$ was added into showroom.")
            stockCars.removeAll(where: {$0.vin == car.vin})
        } else {
            print("Showroom is full,this car will be parked on stock.")
            stockCars.append(car)
            cars.append(car)
        }
    }
    
    func sellCar(car: inout CarProtocol, acces: [Accessories]) {
        if car.isServiced && showroomCars.contains(where: {$0.vin == car.vin}) {
            if car.accessories.isEmpty {
                car.accessories += acces
                print("Thank you for purchasing a car \(name) \(car.model), vin \(car.vin), \(car.color) color, build date: \(car.buildDate) with price \(car.price)$, we hope that the installed accessories will bring you convenience.")
                showroomCars.removeAll(where: {$0.vin == car.vin})
                cars.removeAll(where: {$0.vin == car.vin})
            } else {
                print("Thank you for purchasing a car \(name) \(car.model), vin \(car.vin), \(car.color) color, build date: \(car.buildDate) with price \(car.price)$, we hope that the installed accessories will bring you convenience.")
                showroomCars.removeAll(where: {$0.vin == car.vin})
                cars.removeAll(where: {$0.vin == car.vin})
            }
        } else {
            print("Please check that this car is in the showroom and that it has been serviced")
        }
    }
    
    func orderCar(car: CarProtocol) {
        
        print("Car \(name) \(car.model), vin \(car.vin), \(car.color) color, build date: \(car.buildDate) with price \(car.price)$ was ordered")
        stockCars.append(car)
        cars.append(car)
    }
    func fromStockToShowroom(car: CarProtocol) {
        if stockCars.contains(where: {$0.vin == car.vin}) {
            if showroomCars.count <= showroomCapacity-1 {
//                let filteredArray = showroomCars.filter{$0.isSpecialOffer == car.isSpecialOffer && $0.vin == car.vin}
//                guard filteredArray.count == 0 else {
//                    throw Errors.showRoomCountainsCar
                showroomCars.append(car)
                stockCars.removeAll(where: {$0.vin == car.vin})
//                }
//                showroomCars.append(car)
//                stockCars.removeAll(where: {$0.vin == car.vin})
                
            } else {
                print("You can't put this car in the showroom, first make room for it.")
            }
        } else {
            print("This car (vin: \(car.vin)) is out of stock")
        }
    }
    
}


//print("------------------BMW------------------")
var bmwCar1: CarProtocol = ModelCar(model: "X3", color: "Black", buildDate: 2020, price: 45666, accessories: [], isServiced: false, vin: 1234567890)
var bmwCar2: CarProtocol = ModelCar(model: "X5", color: "White", buildDate: 2020, price: 45645, accessories: [Accessories.antiNoise,Accessories.anticorrosive,Accessories.fenders], isServiced: false, vin: 2234567890)
var bmwCar3: CarProtocol = ModelCar(model: "X6", color: "Grey", buildDate: 2021, price: 234534, accessories: [Accessories.antiNoise,Accessories.anticorrosive], isServiced: false, vin: 3234567890)
var bmwCar4: CarProtocol = ModelCar(model: "X7", color: "Blue", buildDate: 2020, price: 4343455, accessories: [Accessories.antiNoise,Accessories.anticorrosive,Accessories.fenders,Accessories.rugs], isServiced: false, vin: 4234567890)

let bmwDealer = Dealer(showroomCapacity: 4, name: "BMW")
    
//bmwDealer.addToShowroom(car: bmwCar1)
//bmwDealer.addToShowroom(car: bmwCar2)
//bmwDealer.addToShowroom(car: bmwCar3)
//bmwDealer.addToShowroom(car: bmwCar4)
//bmwDealer.offerAccesories(accessories: [Accessories.antiNoise])
//bmwDealer.presaleService(car: &bmwCar1)
//bmwDealer.sellCar(car: &bmwCar1, acces: [Accessories.antiNoise,Accessories.fenders,Accessories.rugs])

//print("------------------Volvo------------------")
var volvoCar1: CarProtocol = ModelCar(model: "XC90", color: "White", buildDate: 2021, price: 34522, accessories: [], isServiced: false, vin: 5234567890)
var volvoCar2: CarProtocol = ModelCar(model: "XC70", color: "Grey", buildDate: 2021, price: 33443, accessories: [], isServiced: false, vin: 6234567890)
var volvoCar3: CarProtocol = ModelCar(model: "XC60", color: "Red", buildDate: 2019, price: 32000, accessories: [Accessories.antiNoise], isServiced: false, vin: 7234567890)
var volvoCar4: CarProtocol = ModelCar(model: "XC40", color: "Black", buildDate: 2019, price: 30000, accessories: [Accessories.fenders], isServiced: false, vin: 8234567890)

let volvoDealer = Dealer(showroomCapacity: 5, name: "Volvo")
    
//volvoDealer.addToShowroom(car: volvoCar1)
//volvoDealer.addToShowroom(car: volvoCar2)
//volvoDealer.addToShowroom(car: volvoCar3)
//volvoDealer.addToShowroom(car: volvoCar4)
//volvoDealer.offerAccesories(accessories: [Accessories.antiNoise])
//volvoDealer.presaleService(car: &volvoCar1)
//volvoDealer.sellCar(car: &volvoCar1, acces: [Accessories.antiNoise,Accessories.fenders,Accessories.rugs])


//print("------------------Honda------------------")
var hondaCar1: CarProtocol = ModelCar(model: "Civic", color: "White", buildDate: 2021, price: 34522, accessories: [], isServiced: false, vin: 5234567890)
var hondaCar2: CarProtocol = ModelCar(model: "Pilot", color: "Grey", buildDate: 2021, price: 33443, accessories: [], isServiced: false, vin: 6234567890)
var hondaCar3: CarProtocol = ModelCar(model: "Legend", color: "Red", buildDate: 2019, price: 32000, accessories: [Accessories.antiNoise], isServiced: false, vin: 7234567890)
var hondaCar4: CarProtocol = ModelCar(model: "CH-R", color: "Black", buildDate: 2019, price: 30000, accessories: [Accessories.fenders], isServiced: false, vin: 8234567890)

let hondaDealer = Dealer(showroomCapacity: 5, name: "Honda")
    
//hondaDealer.addToShowroom(car: hondaCar1)
//hondaDealer.addToShowroom(car: hondaCar2)
//hondaDealer.addToShowroom(car: hondaCar3)
//hondaDealer.addToShowroom(car: hondaCar4)
//hondaDealer.offerAccesories(accessories: [Accessories.antiNoise])
//hondaDealer.presaleService(car: &hondaCar1)
//hondaDealer.sellCar(car: &hondaCar1, acces: [Accessories.antiNoise,Accessories.fenders,Accessories.rugs])



//print("------------------Lexus------------------")
var lexusCar1: CarProtocol = ModelCar(model: "LX570", color: "White", buildDate: 2021, price: 34522, accessories: [], isServiced: false, vin: 5234567890)
var lexusCar2: CarProtocol = ModelCar(model: "GX460", color: "Grey", buildDate: 2021, price: 33443, accessories: [], isServiced: false, vin: 6234567890)
var lexusCar3: CarProtocol = ModelCar(model: "RX350", color: "Red", buildDate: 2020, price: 32000, accessories: [Accessories.antiNoise], isServiced: false, vin: 7234567890)
var lexusCar4: CarProtocol = ModelCar(model: "IS350", color: "Black", buildDate: 2019, price: 30000, accessories: [Accessories.fenders], isServiced: false, vin: 8234567890)

let lexusDealer = Dealer(showroomCapacity: 6, name: "Lexus")
    
//lexusDealer.addToShowroom(car: lexusCar1)
//lexusDealer.addToShowroom(car: lexusCar2)
//lexusDealer.addToShowroom(car: lexusCar3)
//lexusDealer.addToShowroom(car: lexusCar4)
//lexusDealer.offerAccesories(accessories: [Accessories.antiNoise])
//lexusDealer.presaleService(car: &lexusCar1)
//lexusDealer.sellCar(car: &lexusCar1, acces: [Accessories.antiNoise,Accessories.fenders,Accessories.rugs])



//print("------------------Audi------------------")
var audiCar1: CarProtocol = ModelCar(model: "A8", color: "White", buildDate: 2020, price: 34522, accessories: [], isServiced: false, vin: 5234567890)
var audiCar2: CarProtocol = ModelCar(model: "A7", color: "Grey", buildDate: 2021, price: 33443, accessories: [], isServiced: false, vin: 6234567890)
var audiCar3: CarProtocol = ModelCar(model: "A6", color: "Red", buildDate: 2020, price: 32000, accessories: [Accessories.antiNoise], isServiced: false, vin: 7234567890)
var audiCar4: CarProtocol = ModelCar(model: "A4", color: "Black", buildDate: 2021, price: 30000, accessories: [Accessories.fenders], isServiced: false, vin: 8234567890)

let audiDealer = Dealer(showroomCapacity: 5, name: "Audi")
    
//audiDealer.addToShowroom(car: audiCar1)
//audiDealer.addToShowroom(car: audiCar2)
//audiDealer.addToShowroom(car: audiCar3)
//audiDealer.addToShowroom(car: audiCar4)
//audiDealer.offerAccesories(accessories: [Accessories.antiNoise])
//audiDealer.presaleService(car: &audiCar1)
//audiDealer.sellCar(car: &audiCar1, acces: [Accessories.antiNoise,Accessories.fenders,Accessories.rugs])


/* Не знаю как в моем случае решить эту задачу с использованием приведения типов, так как в массиве у меня лежит один тип, не чего не к чему приводить :)
   Но конструкция была что-то типа:
 
 var arrayOfDealers: [Dealership] = [bmwDealer,volvoDealer,hondaDealer,lexusDealer,audiDealer]
 
 for dealer in arrayOfDealers {
     if let d1 = dealer as? BMWDealer {
         print("BMW. Driving pleasure")
     } else if let d2 = item as? VolvoDealer {
         print("Volvo for life")
     } else if let d3 = item as? HondaDealer {
         print("Honda. First a man, then a car")
     } else if let d4 = item as? LexusDealer {
         print("Lexus. The Passionate Pursuit of Perfection")
     } else if let d5 = item as? AudiDealer {
         print("Audi. Advantage through technology")
     }
 }
 */
var arrayOfDealers: [Dealership] = [bmwDealer,volvoDealer,hondaDealer,lexusDealer,audiDealer]

////print("------------------Tagline------------------")
//for dealer in arrayOfDealers {
//    switch dealer.name {
//    case "Honda" :
//        print("Honda. First a man, then a car")
//    case "Lexus" :
//        print("Lexus. The Passionate Pursuit of Perfection")
//    case "BMW" :
//        print("BMW. Driving pleasure")
//    case "Volvo" :
//        print("Volvo for life")
//    case "Audi" :
//        print("Audi. Advantage through technology")
//    default :
//        print("Oops, thomethind went wrong")
//    }
//}

//MARK: Part4
/*
 Работа с расширениями. Нам нужно добавить спецпредложение для "прошлогодних" машин.

 Алгоритм выполнения:
 1. Создайте протокол SpecialOffer.
 2. Добавьте методы:
 - 'addEmergencyPack()': не принимает никаких параметров. Метод добавляет аптечку и огнетушитель к доп. оборудованию машины.
 - 'makeSpecialOffer()': не принимает никаких параметров. Метод проверяет дату выпуска авто, если год выпуска машины меньше текущего, нужно сделать скидку 15%, а также добавить аптеку и огнетушитель.
 3. Используя расширение, реализуйте протокол 'SpecialOffer' для любых трех дилерских центров.
 4. Проверьте все машины в дилерском центре (склад + автосалон), возможно они нуждаются в специальном предложении. Если есть машины со скидкой на складе, нужно перегнать их в автосалон.
 */

protocol SpecialOffer {

}
/*
 Задание с занятия об обработке ошибок:
 1.
 - Внесите изменения в метод 'makeSpecialOffer()' таким образом, чтобы он возвращал ошибку, если машина не соответствует требованиям акции.
 - В случае, если нет ошибки, сделайте для этой машины специальное предложение.
 - Проверьте текущий список машин, чтобы при проверке генерировались ошибки. При необходимости, внесите изменения.
 - Обработайте ошибки.
 
 2.
 - Перейдите к той части кода, где вы выполняли следующее задание: "Проверьте все машины в дилерском центре (склад + автосалон), возможно они нуждаются в специальном предложении. Если есть машины со скидкой на складе, нужно перегнать их в автосалон."
 - Аналогично первой задаче, внесите изменения в код таким образом, чтобы осуществлялся возврат ошибки в том случае, если машина со скидкой уже находится в автосалоне. В том случае, если ошибки нет, нужно перегнать машину в автосалон.
 - Проверьте текущий список машин, чтобы при проверке генерировались ошибки. При необходимости, внесите изменения.
 - Обработайте ошибки.
 
 */
enum Errors: Error {
    case incorrectBuildDate(Int)
    case showRoomCountainsCar
}

extension SpecialOffer {
    func addEmergencyPack(car : inout CarProtocol, fstAidAndAlarm: [Accessories]) { // Не получилось пока придумать, как передать в функцию два определенных элемента enum, поэтому, в названии параметра оставил подсказку что нужно добавить (fstAidAndAlarm)
        car.accessories += fstAidAndAlarm
        print("First aid kit and alarm system were added into car \(car.model) with vin: \(car.vin).")
    }
    func specialOffer(car : inout CarProtocol) throws {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        guard car.buildDate >= year else {
            throw Errors.incorrectBuildDate(year)
        }
        car.price = car.price * 3 / 4
        addEmergencyPack(car: &car, fstAidAndAlarm: [Accessories.alarmSystem,Accessories.firstAidKit])
        car.isSpecialOffer = true
        print("Discount was applied for car (vin: \(car.vin))")
    }
    
    func makeSpecialOffer(car : inout CarProtocol) {
        do {
            try specialOffer(car: &car)
        } catch Errors.incorrectBuildDate(let currentDate) {
            print("Build date of car (vin: \(car.vin)) is less than \(currentDate)")
        } catch {
            print("Oops, thomething went wrong")
        }
        
    }
}

extension Dealer {
    func checkCarsForSpessialOffer(stock: [CarProtocol], showroom: [CarProtocol]) throws {

        for var carsST in stock {
            let priceBefore = carsST.price
            makeSpecialOffer(car: &carsST)
            let priceAfter = carsST.price
            if priceAfter < priceBefore {
                let filteredArray = showroomCars.filter{$0.isSpecialOffer == carsST.isSpecialOffer && $0.vin == carsST.vin}
                guard filteredArray.count == 0 else {
                    throw Errors.showRoomCountainsCar
                }
                    fromStockToShowroom(car: carsST)
            }
        }
        for var carsSR in showroom {
            if carsSR.isSpecialOffer {
                print("The special offer has already been applied to this car (vin: \(carsSR.vin))")
            } else {
                makeSpecialOffer(car: &carsSR)
            }
        }

    }
    
    func checkCarsForSpessialOfferNow(stockArray: [CarProtocol], showroomArray: [CarProtocol]) {
        do {
            try checkCarsForSpessialOffer(stock: stockArray, showroom: showroomArray)
        } catch Errors.showRoomCountainsCar {
            print("Oops, the showroom already contains this car and has a discount applied to it.")
        } catch {
            print("Oops, thomething went wrong")
        }
    }
}

print("------------------Part 4------------------")
lexusDealer.orderCar(car: lexusCar1)
lexusDealer.orderCar(car: lexusCar2)
lexusDealer.orderCar(car: lexusCar3)
lexusDealer.orderCar(car: lexusCar4)
print("----")
print(lexusDealer.stockCars.count)
print(lexusDealer.showroomCars.count)
print("----")
lexusDealer.checkCarsForSpessialOfferNow(stockArray: lexusDealer.stockCars, showroomArray: lexusDealer.showroomCars)

//lexusDealer.makeSpecialOffer(car: &volvoCar1)
//lexusDealer.makeSpecialOffer(car: &lexusCar4)
print(lexusDealer.stockCars.count)
print(lexusDealer.showroomCars.count)
lexusDealer.orderCar(car: lexusCar1)




print(lexusDealer.stockCars.count)
print(lexusDealer.showroomCars.count)

lexusDealer.checkCarsForSpessialOfferNow(stockArray: lexusDealer.stockCars, showroomArray: lexusDealer.showroomCars)


print(lexusDealer.stockCars.count)
print(lexusDealer.showroomCars.count)
