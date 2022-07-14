import UIKit

protocol Recipe {
    var name: String { get set } //can be read (“get”) or written (“set”)
}

struct Breakfast: Recipe {
    var name: String
}

struct Lunch: Recipe {
    var name: String
}

struct Dinner: Recipe {
    var name: String
}

func display(with RecipeName: Recipe) -> Void {
    print("My recipename is \(RecipeName.name)")
}

let breakfast = Breakfast(name: "Scrambled eggs")
let lunch = Lunch(name: "Grilled cheese sandwich")
let dinner = Dinner(name: "Mac & Cheese")

let today: [Recipe] = [breakfast, lunch, dinner]

for meal in today {
            display(with: meal)
}

//inheritance

protocol User {
    var username: String { get set }
    
    func login(username: String)
}

protocol Payroll {
    var monthlySalary: Double { get set }
    
    func calculateWage()
}

protocol Security {
    func unlockDoor() -> Bool
}

protocol Employee: User, Payroll, Security {}

struct Worker: Employee {
    var username: String
    var monthlySalary: Double
    
    func login(username: String) -> Void {
        print("\(username) has logged in at \(Date.now)")
    }
    func calculateWage() {
        print("\(username) has a salary of \(monthlySalary * 12) a year")
    }
    func unlockDoor() -> Bool {
        true
    }
}

let bob = Worker(username: "BobbyLabour1993", monthlySalary: 1500)
bob.calculateWage() //BobbyLabour1993 has a salary of 18000.0 a year
bob.unlockDoor() // returns true
bob.login(username: "TestEmployee123") //TestEmployee123 has logged in at 2022-07-14 09:26:02 +0000

//Extensions
extension Employee {
    func introduction() {
        print("This is \(username) who has a monthly salary of \(monthlySalary).")
    }
}

bob.introduction()
