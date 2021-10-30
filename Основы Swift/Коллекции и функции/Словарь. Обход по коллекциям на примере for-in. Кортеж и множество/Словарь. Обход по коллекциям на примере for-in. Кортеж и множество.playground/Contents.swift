import UIKit

// MARK: Task1

// 1.1
var favouriteThings = (movie : "Inception", number : 23, dish : "khinkali")
//1.2
var (movie, number, dish) = favouriteThings
//1.3
var favouriteThings2 = (movie : "Fast and furious", number : 0, dish : "borsch")
//1.4
var intermediateTuple = (movie : "", number : 0, dish : "")
intermediateTuple = favouriteThings
favouriteThings = favouriteThings2
favouriteThings2 = intermediateTuple
//1.5
var newTuple = (favouriteThings.number, favouriteThings2.number, favouriteThings.number - favouriteThings2.number)


// MARK: Task2

//Если делать чётко по заданию, то ИМХО программа будет "негибкая", поэтому решил пойти по данному пути, стараясь максимально смоделировать реальные условия

var studentName = ["Ivan", "Mike", "Ruslan"]
var itemName = ["Biology", "Math", "History"]
var marks = [3,4,5]

var seqItemMark = zip(itemName, marks)

var itemMarkDict = Dictionary(uniqueKeysWithValues: seqItemMark)

var diaryDict = [studentName[0] : [itemMarkDict]] //  Заполним журнал к примеру, для Ивана
print(diaryDict)


// MARK: Task3,4

typealias Chessman = [String: (alpha:Character?, num: Int?)] // Создаю псевдоним типа Chessman, тип tuple в значении словаря специально указываю (alpha:Character?, num: Int?) а не (alpha:Character, num: Int)?, так как во втором случае, при заполнении словаря Chessmans и отсутствии координат, например var coordOfFig3: (Character, Int)? = nil программа проигнорирует эту фигуру в принципе и не запишет ее в словарь. А раз ее нет в словаре, то и проверить ее наличие на шахматной доске никак не получится.

var Chessmans = Chessman()

var figureName = ["Queen", "King", "Bishop"] // Создаю массив с фигурами (3 шт взяты для примера, можно больше)
var coordOfFig1: (Character?, Int?) = ("B", 2)
var coordOfFig2: (Character?, Int?) = ("A", 8)
var coordOfFig3: (Character?, Int?) = (nil, nil) // Здесь сперва может показаться, что программа несовершенна, и                                                    пользователь может по ошибке внести название фигуры, например                                                   "Bishop" и неполную ее координату, например ("А", nil), но                                                      этот момент предусмотрен в конце программы (в цикле)*

Chessmans[figureName[0]] = coordOfFig1 // Наполняем словарь
Chessmans[figureName[1]] = coordOfFig2
Chessmans[figureName[2]] = coordOfFig3

for (key,value) in Chessmans {
    if let alpha = value.alpha, let num = value.num {    // Вот та самая проверка, которая исключает ошибку,                                                            описанную выше *
        print("Chessman \"\(key)\" has coordinate \"\(alpha):\(num)\"")
    } else {
        print("\(key) is slained")
    }
}


