import UIKit

var str = "Hello, playground"

print("Ain\u{1}t this a beautiful day")

let aScalars = "A".unicodeScalars
let aCode = aScalars[aScalars.startIndex].value

let letters: [Character] = (0..<52).map {
    i in
    Character(UnicodeScalar(aCode + i)!)
}

str.append(letters[1])
print(str)

print(letters)

let someArray: [Int?] = [1,23,4,5,nil]

let result: [Int] = someArray.compactMap({ $0
})

print(result)

/*
print(Date().timeIntervalSinceReferenceDate)
//DispatchQueue.main.asyncAfter(deadline: .init(uptimeNanoseconds: .init(1)), execute: {
//    print(Date().timeIntervalSinceReferenceDate)
//})

/// Threads

class CustomThread: Thread {
    let id: String
    
    init(id: String) {
        self.id = id
        super.init()
    }
    
    override func main() {
        print(id)
    }
}


let thread = CustomThread(id: "hi!")
thread.start()


/// GCD

let serialQueueSlow = DispatchQueue(label: "someQueue", qos: .background)

let serialQueueFast = DispatchQueue(label: "someQueueFast", qos: .userInteractive)

for _ in 1...50 {
    serialQueueFast.async {
        var x: Double = 34532452345.466345

        for _ in 1...100 {
//            x = sqrt(x)
            let view = UIView()
        }
        
        print("fast")
    }

    serialQueueSlow.async {
        var x: Double = 34532452345.466345

        for _ in 1...100 {
//            x = sqrt(x)
            let view = UIView()
        }
        
        print("slow")
    }
}


let concurrentQueueSlow = DispatchQueue(label: "someQueue", qos: .background, attributes: .concurrent)

let concurrentlQueueFast = DispatchQueue(label: "someQueueFast", qos: .userInteractive, attributes: .concurrent)

for _ in 1...100 {
    concurrentlQueueFast.async {
//        var x: Double = 34532452345.466345
        
        
        for _ in 1...100 {
//            x = sqrt(x)
            let view = UIView()
        }
        
        print("fast")
    }
    
    concurrentQueueSlow.async {
        var x: Double = 34532452345.466345
        
//        let view = UIView()
        
        for _ in 1...100 {
//            x = sqrt(x)
            let view = UIView()
        }
        
        print("slow")
    }
}
*/
//
//DispatchTime
//concurrentlQueueFast.asyncAfter(deadline: <#T##DispatchTime#>, execute: <#T##() -> Void#>)




/// DispatchWorkItem

let dispatchWorkItemQueue = DispatchQueue.global(qos: .userInteractive)

let dispatchWorkItemQueue1 = DispatchQueue.global(qos: .background)

print(dispatchWorkItemQueue.label)
print(dispatchWorkItemQueue1.label)

print(dispatchWorkItemQueue1 == dispatchWorkItemQueue)

class A: Equatable {
    static func == (lhs: A, rhs: A) -> Bool {
        return lhs.x == rhs.x
    }
    
    let x: Double = 1
}

struct B: Equatable {
    let y: Double
}


//
//class B {
//    let y: Double = 1
//}
/*
let a = A()

let b = A()

print(a == b)

let customDispatchWorkItem = DispatchWorkItem(qos: .background, block: {
    print("hi")
})

dispatchWorkItemQueue.async(execute: customDispatchWorkItem)

///


let group = DispatchGroup()

group.enter()
print("im in")
dispatchWorkItemQueue.async {
    print("im out")
    group.leave()
}

group.enter()
print("im in")
dispatchWorkItemQueue.async {
    print("im out")
    group.leave()
}

group.enter()
print("im in")
dispatchWorkItemQueue.async {
    print("im out")
    group.leave()
}

group.notify(queue: .main, execute: {
    print("all ends")
})

*/
/// operation

class CustomOperation: Operation {
    let doBlock: () -> Void
    
    init(doBlock: @escaping () -> Void) {
        self.doBlock = doBlock
        
        super.init()
    }
    override func main() {
        print("block started")
        doBlock()
    }
}


let customOperation = CustomOperation(doBlock: {
    print("hello!")
})

let operationQueue = OperationQueue()
operationQueue.qualityOfService = .background

class SlowOperation: Operation {
    override var isAsynchronous: Bool {
        return true
    }
    
    override var isConcurrent: Bool {
        return true
    }
    
    override func main() {
        print("slow")
        
        for _ in 1...100 {
           _ = UIView()
        }
    }
}

class FastOperation: Operation {
    override var isAsynchronous: Bool {
        return true
    }
    
    override var isConcurrent: Bool {
        return true
    }
    
    override func main() {
        print("fast")
        
        for _ in 1...1000 {
           _ = UIView()
        }
    }
}

let slowQueue = OperationQueue()
slowQueue.qualityOfService = .background
let fastQueue = OperationQueue()
fastQueue.qualityOfService = .userInteractive

for _ in 1...100 {
    let slowOperation = SlowOperation()
    slowOperation.qualityOfService = .background

    let fastOperation = FastOperation()
    fastOperation.qualityOfService = .userInteractive
    
    let fastOperation1 = SlowOperation()
    fastOperation1.qualityOfService = .background
    
    fastQueue.addOperation(fastOperation)
    slowQueue.addOperation(fastOperation1)
}
