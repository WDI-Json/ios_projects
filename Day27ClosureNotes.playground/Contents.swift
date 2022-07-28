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
class Baker {
    func bakeStuff() {
        print("I am baking things!")
    }
}

func bake() -> () -> Void {
    
    let baker = Baker()
    
    let baking = { [unowned baker] in //capture list. It's 1 item now but could be more!
        baker.bakeStuff() //notice how the baker object is now considered an optional!
        return
    }
    return baking
}

let bakeFunction = bake()
bakeFunction() //crash
