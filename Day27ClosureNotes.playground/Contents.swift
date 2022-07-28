import UIKit

//simple class
class Baker {
    func BakeStuff() {
        print("I am baking things!")
    }
}

func bake() -> () -> Void {
    
    let baker = Baker()
    
    let baking = {
        baker.BakeStuff()
        return
    }
    return baking
}

let bakeFunction = bake()
bakeFunction()
