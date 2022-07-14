import UIKit

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

//Deinit

class SecretMessage {
    var message: String
    
    init(message: String) {
        self.message = message
        print("initialized!")
    }
    
    func printMessage() -> Void {
        print(self.message)
    }
    
    deinit {
        print("the secret message '\(message)' is being deleted!")
    }
}
let messages = ["I am secret!", "Well hello there", "Bananakin"]

for item in messages {
    let secret = SecretMessage(message: item)
    secret.printMessage()
}


