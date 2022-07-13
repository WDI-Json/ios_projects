import UIKit

var greeting = "Hello, playground"

class Recipe {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Taco: Recipe {
    var vegetarian: Bool
    var containsLettuce: Bool
    
    init(name: String, containsLettuce: Bool, vegetarian: Bool) {
        self.containsLettuce = containsLettuce
        self.vegetarian = vegetarian
        
        super.init(name: name)
    }
}

let taco = Taco(name: "plain taco", containsLettuce: true, vegetarian: false)
print(taco.name)
