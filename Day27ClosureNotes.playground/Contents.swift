////simple class
//class Baker {
//    func bakeStuff() {
//        print("I am baking things!")
//    }
//}
//
//func bake() -> () -> Void {
//
//    let baker = Baker()
//
//    let baking = {
//        baker.bakeStuff()
//        return
//    }
//    return baking
//}
//
//let bakeFunction = bake()
//bakeFunction() //I am baking things!

//Weak

//simple class
//class Baker {
//    func bakeStuff() {
//        print("I am baking things!")
//    }
//}
//
//func bake() -> () -> Void {
//
//    let baker = Baker()
//
//    let baking = { [weak baker] in //capture list. It's 1 item now but could be more!
//        baker?.bakeStuff() //notice how the baker object is now considered an optional!
//        return
//    }
//    return baking
//}
//
//let bakeFunction = bake()
//bakeFunction() //

//unowned

//simple class
//class Baker {
//    func bakeStuff() {
//        print("I am baking things!")
//    }
//}
//
//func bake() -> () -> Void {
//
//    let baker = Baker()
//
//    let baking = { [unowned baker] in //capture list. It's 1 item now but could be more!
//        baker.bakeStuff() //notice how the baker object is now considered an optional!
//        return
//    }
//    return baking
//}
//
//let bakeFunction = bake()
//bakeFunction() //crash
import UIKit

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

let queue = DispatchQueue.main

func main() {
    let x = Person(name: "Harrie Snotter")
    
    queue.asyncAfter(deadline: .now() + 3) { [unowned x] in
        print("at 3 secs async name = \(x.name)")
    }
    
    queue.asyncAfter(deadline: .now() + 5) { [x] in
        print("at 5 secs async name = \(x.name)")
    }

    queue.asyncAfter(deadline: .now() + 10) { [weak x] in
        print("at 10 secs async name = \(x?.name)")
    }
}


main()
