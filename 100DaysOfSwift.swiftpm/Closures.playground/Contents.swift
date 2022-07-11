import UIKit

//Basic closure
let closureString = {
    print("this is a closure!")
}
closureString() //this is a closure!

//Closure accepting parameters
let baking = { (recipeName: String) in
    print("Baking a \(recipeName) today!")
}
//different functions vs closures --> no parameter labels!
baking("Brownie") //Baking a Brownie today!
baking("Cake") //Baking a Cake today!
baking("Pie") //Baking a Pie today!

//with return value
let addingRecipe = { (RecipeName: String) -> String in
    print("I will add \(RecipeName) to the bakinglist!")
    return "\(RecipeName) is added to the list."
}
addingRecipe("Cheesecake") // I will add Cheesecake to the bakinglist!

print(addingRecipe("Cheesecake")) //will print "I will add Cheesecake to the bakinglist!" and the returned value: "Cheesecake is added to the list."


//You can also use closures as parameters
// selectedBakeAction is the parameter name for the closure we are accepting

let bakingCake = {
    print("Let's put the prepared cake in the oven")
}

func preparing(selectedBakeAction: () -> Void) {
    print("Grabbing ingredients...")
    selectedBakeAction()
    print("Done!")
}

preparing(selectedBakeAction: bakingCake)
//trailing closure syntax
preparing() {
    bakingCake()
}
//yields the same
preparing {
    bakingCake()
}

func preparing(selectedBakeAction: (String) -> Void) {
    print("Grabbing ingredients...")
    selectedBakeAction("Cheesecake")
    sleep(2)
    print("...")
    sleep(1)
    print("Done!")
}
//notice how the closure in itself returns nothing but accepts a string
preparing { (RecipeName: String) in
    print("I will add \(RecipeName) to the bakinglist!")
    print("Let's get started with our oven-baked \(RecipeName)!")
}


//Closure as parameter of function yielding return
//the selectedBakeAction returns a String.
func preparingRecipe(selectedBakeAction: (String) -> String) {
    print("Grabbing ingredients...")
    let selectedRecipe = selectedBakeAction("Cherry pie")
    sleep(2)
    print("...")
    print("\(selectedRecipe) it is almost done.")
    sleep(1)
    print("Done!")
}


preparingRecipe { (RecipeName: String) -> String in
    return
    """
    I will add \(RecipeName) to the bakinglist!
    Let's get started with our oven-baked \(RecipeName)!
    """
}

//shorthand syntax possibilities
//Swift knows the parameter to that closure must be a string, so we can remove it:
preparingRecipe { RecipeName -> String in
    return
    """
    I will add \(RecipeName) to the bakinglist!
    Let's get started with our oven-baked \(RecipeName)!
    """
}
//It also knows the closure must return a string, so we can remove that:
preparingRecipe { RecipeName in
    return
    """
    I will add \(RecipeName) to the bakinglist!
    Let's get started with our oven-baked \(RecipeName)!
    """
}
//As the closure only has one line of code that must be the one that returns the value, so Swift lets us remove the return keyword too:
preparingRecipe { RecipeName in
    """
    I will add \(RecipeName) to the bakinglist!
    Let's get started with our oven-baked \(RecipeName)!
    """
}
//or use Swift's automatic variable names. Rather than writing place in we can let Swift provide automatic names for the closure’s parameters. These are named with a dollar sign, then a number counting from 0.
preparingRecipe {
    """
    I will add \($0) to the bakinglist!
    Let's get started with our oven-baked \($0)!
    """
}

//Handling multiple parameters
func prepMultiple(action: (String, Int) -> String) {
    print("Grabbing ingredients...")
    let amountBaked = action("Cherry pie", 4)
    print(amountBaked)
}

prepMultiple {
    """
    let's bake \($1) different \($0)s
    """
}
