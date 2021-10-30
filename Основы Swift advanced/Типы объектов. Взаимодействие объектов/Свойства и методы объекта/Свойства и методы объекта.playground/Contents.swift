
import UIKit

//MARK: Task1
/*
 Задача 1.
 Вы разрабатываете библиотеку аудиотреков. Вам необходимо реализовать одну из категорий музыки, наполненную треками.

 Алгоритм выполнения
 1.Создайте объект трек.
 2.Определите в нем свойства имя, исполнитель, длительность и страна.
 3.Создайте класс категория.
 4.Объявите в нем свойства название категории, список треков и количество треков в списке (экспериментируйте с "ленивыми" и вычисляемыми свойствами).
 5.Определите методы добавления и удаления треков в эту категорию.
 */

class Track {
    var name: String
    var executor: String
    var duration: Float
    var country: String
    
    init(name: String, executor: String, duration: Float, country: String) {
        self.name = name
        self.executor = executor
        self.duration = duration
        self.country = country
    }

}

class Category {
    var nameOfCategory: String
    lazy var trackList = [String:Track]()
    var countOfTrack: Int  {
        trackList.count
    }
    
    init(nameOfCategory: String) {
        self.nameOfCategory = nameOfCategory
    }
    
    func addTrackInCat( track: Track ) {
        trackList[track.name] = track
        print("Track with name '\(track.name)' added in selected category.")
    }
    
    func removeTrackFromCat( track: Track ) {
        guard let track = trackList[track.name] else {
            print("Sorry, there is no such track in the category.")
            return
            
        }
        trackList[track.name] = nil
    }
    
    func showAll(){
        trackList.keys.forEach{
            print("'\($0)'")
        }
    }
    
}

//MARK: Task 2,3*

/*
 Задача 2
 Доработайте свою библиотеку так, чтобы в ней было несколько категорий.

 Алгоритм выполнения
 Создайте класс библиотеки. Этот класс будет аналогичен классу категории, только хранить он должен список категорий.

 Задача 3 * (задача со звездочкой):
 Преобразуйте классы так, чтобы в пределах вашей библиотеки можно было обмениваться треками между категориями.
 */

class Library {
    lazy var categories = [String:Category]()
    
    func addCatInLib(category: Category) {
        categories[category.nameOfCategory] = category
        print("Category with name '\(category.nameOfCategory)' added in selected library.")
    }
    
    func removeCatFromLib(category: Category) {
        guard let category = categories[category.nameOfCategory] else {
            print("Sorry, there is no such category in the library.")
            return
        }
        categories[category.nameOfCategory] = nil
        
    }
    
    func showAll(){
        categories.keys.forEach{
            print("'\($0)'")
        }
    }
    
    // Task 3*
    func change(track: Track, form category1: Category, to  category2: Category) {
        if categories.keys.contains(category1.nameOfCategory) && categories.keys.contains(category2.nameOfCategory) {
            if category1.nameOfCategory.contains(track.name) {
                category1.removeTrackFromCat(track: track)
                category2.addTrackInCat(track: track)
            } else {
                print("The category from which you want to transfer does not contain this track.")
            }
        }
        else {
            print("Please check the availability of the selected categories in this library.")
        }
        
    }
    
}


let category = Category(nameOfCategory: "Alternative Rock")
let category2 = Category(nameOfCategory: "RnB")
let category3 = Category(nameOfCategory: "POP")
let track = Track(name: "Numb", executor: "Linkin Park", duration: 3.33, country: "USA")
let track2 = Track(name: "In the End", executor: "Linkin Park", duration: 3.05, country: "USA")
let track3 = Track(name: "New divide", executor: "Linkin Park", duration: 4.15, country: "USA")
let track4 = Track(name: "One More Light", executor: "Linkin Park", duration: 3.25, country: "USA")
category.addTrackInCat(track: track)
category.addTrackInCat(track: track2)
print("--------")
category2.addTrackInCat(track: track3)
category2.addTrackInCat(track: track4)
category.showAll()
print("--------")
category2.showAll()

let library1 = Library()
let library2 = Library()
library1.addCatInLib(category: category)
library1.addCatInLib(category: category2)
library1.showAll()
print("--------")
library2.showAll()

library1.change(track: track3, form: category, to: category2)
category.showAll()
print("--------")
category2.showAll()


















