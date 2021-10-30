import Foundation

//-----------------Вставка кода с предыдущего ДЗ------------------

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
let track = Track(name: "Shivers", executor: "Ed", duration: 3.58, country: "GB")

//-----------------Вставка кода с предыдущего ДЗ------------------




// MARK: Task 1,2

class Artist {
    
    var name: String
    var country: String
    var genre: String
    
    init(name: String, country: String, genre: String) {
        self.name = name
        self.country = country
        self.genre = genre
    }
    
    func writingTrack(song: Track) {
        print("I \(song.executor), and I wrote track \(song.name) ")
    }
    
    func performingTrack(song: Track) {
        print("I \(song.executor), and I performed track \(song.name) ")
    }
}

let artist = Artist(name: "Will", country: "USA", genre: "Pop")
artist.performingTrack(song: track)
//1st artist____________________________________________________

final class FirstArtist: Artist {
    
    var role: String
    override var name: String {
        get {
            "Best " + super.name
        }
        set {
            super.name = newValue
        }
    }
    init(name: String, country: String, genre: String, role: String) {
        self.role = role
        super.init(name: name, country: country, genre: genre)
    }
    func myRole() {
        print("I am \(name), and I am a \(role).")
    }
}
let firstArtist = FirstArtist(name: "Chester", country: "USA", genre: "Rock", role: "soloist")

//2nd artist____________________________________________________

final class SecondArtist: Artist {
    
    var isSick: Bool = false
    func notSick() {
        if !isSick {
            isSick.toggle()
        }
    }
    func sick() {
        if isSick {
            isSick.toggle()
        }
    }
    override var name: String {
        get {
            "" + super.name + ""
        }
        set {
            super.name = newValue
        }
    }
    func avalibleOfArtist() {
        if isSick {
            print("I am \(name), and I can't be at the concert.")
        } else {
            print("I am \(name), and I can be at the concert.")
        }
    }
    
}
let secondArtist = SecondArtist(name: "Chris", country: "USA", genre: "Pop")

//3rd artist____________________________________________________

final class ThirdArtist: Artist {
    
    var age: Int
    init(name: String, country: String, genre: String, age: Int) {
        self.age = age
        super.init(name: name, country: country, genre: genre)
    }
    
    func alcoholDrincing () {
        if age >= 18 {
            print("I am allowed to drink alcohol.")
        } else {
            print("I am not allowed to drink alcohol, I am too young")
        }
    }
}
let thirdArtist = ThirdArtist(name: "Justin", country: "USA", genre: "Pop", age: 17)


//MARK: Task3*

var arrayOfArtists: [Artist] = [firstArtist,secondArtist,thirdArtist]


/*
 Выполняя данное задание я закрепил понимание работы наследования, на практике разобрал какой класс является суперклассом и подклассом, и в чем их разница. Научился защищать данные классов от переопределения и наследования(модификаторы доступа).

 
 Понимание темы оцениваю на 4 из 5, так как недостаточно практики в области ненарушения принципа Барбары Лисков, а так же необходимо закрепить понимание переопределения инициализвторов и двухфазной инициализации.
 */



