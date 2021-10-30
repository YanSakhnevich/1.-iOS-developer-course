import Foundation


// MARK: Task1

typealias InternalParam = (Double,Double) -> Double

let bob: InternalParam = { weight,distanse -> Double in
    return weight*distanse/2
}

let mike: InternalParam = { weight,distanse -> Double in
    return weight*distanse*2
}
  
    
func fuelConsumption(from: InternalParam) {
    let weight = 2.2
    let distanse = 1394.93
    let rezult = from(weight,distanse)
    print(rezult)
}

print("---Task1---")
fuelConsumption(from: bob)

// MARK: Task2

typealias InternalParam2 = (Double,Double) -> Double

let bob2: InternalParam2 = { $0*$1/3 }

let mike2: InternalParam2 = { $0*$1*3 }
  
    
func fuelConsumption2(from: InternalParam2) {
    let weight = 2.2
    let distanse = 1394.93
    let rezult = from(weight,distanse)
    print(rezult)
}
print("---Task2---")
fuelConsumption2(from: bob2)


// MARK: Task3

print("---Task3---")
fuelConsumption{$0*$1*100}

/*
 Объяснить, куда и почему исчезло ключевое слово ('param' - в примере) для параметра.
 
 func example(param: () -> Void) {
     // ...
 }
     
 example {
     // ...
 }
 
 Trailing closure. Если в функции последний параметр замыкание то его можно вынести за круглые скобки а дальше использовать краткую запись замыкания. Опускаем и имена параметров и их тип и in и return оставляем только суть.
*/
