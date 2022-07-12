import UIKit

struct Recipe {
    var name: String
    var cookedBefore: Bool
    
    //conditional computed property
    var classicMeal: String {
        if cookedBefore {
            return "\(name) is a classic meal!"
        } else {
            return "\(name) is not a classic meal."
        }
    }
}

let tacos = Recipe(name: "Tacos", cookedBefore: true)
print(tacos.classicMeal) //Tacos is a classic meal!

//Property observers let you run code before or after any property changes.
struct RecipeOrder {
    var name: String
    var amountLeft: Int {
        
        //before a property changes
        willSet {
            print("the order of \(name)'s contains \(amountLeft)")
        }
        //after a property changes
        didSet {
            if amountLeft != 0 {
                print("the order of \(name)'s only needs \(amountLeft) more")
            } else {
                print("All orders done!")
            }
        }
    }
}

var orders = RecipeOrder(name: "Taco", amountLeft: 3)
orders.amountLeft = 2
orders.amountLeft = 1
orders.amountLeft = 0

//struct taco {
//    var amount: Int
//
//    func getFlourGram() -> Int {
//        return amount * 100
//    }
//}
//
//let orderedTacos = taco(amount: 10)
//print("We need \(orderedTacos.getFlourGram())gr of flour to bake this")
//struct taco {
//    var amount: Int
//    var flourNeeded: Int = 0
//
//    mutating func getFlourGram() -> Void {
//        flourNeeded = amount * 100
//    }
//}
//
//var orderedTacos = taco(amount: 5)
//print(orderedTacos.flourNeeded) // 0
//orderedTacos.getFlourGram()
//print(orderedTacos.flourNeeded) // 500



struct taco {
    var name: String
    var amount: Int
    var flourNeeded: Int
    
    init() {
        print("Creating a new taco entry!")
        name = "Unknown"
        amount = 0
        flourNeeded = 0
    }
}
var newTaco = taco()
print("our taco is called \(newTaco.name) and needs \(newTaco.flourNeeded) grams of flour for \(newTaco.amount) taco('s)")
newTaco.name = "Taco Maximus"
newTaco.amount = 1
newTaco.flourNeeded = 100
print("our taco is called \(newTaco.name) and needs \(newTaco.flourNeeded) grams of flour for \(newTaco.amount) taco('s)")


struct Car {
    
    init() {
        print("Creating car struct")
    }
}

struct Volkswagen {
    var name: String
    lazy var vehicleType = Car()
    
    init(name: String) {
        self.name = name
    }
}
var polo = Volkswagen(name: "Polo")
print(polo.vehicleType)

struct User {
    var name: String
    private var userID: Int
    
    init(name: String, userID: Int) {
        self.name = name
        self.userID = userID
    }
    func getUserID() -> String {
        return "USERID: \(userID)"
    }
}

let user = User(name: "SuperDev420", userID: 12345)
print(user.getUserID())
