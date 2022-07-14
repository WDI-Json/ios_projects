import UIKit

var optionalName: String? = nil

if let unwrapped = optionalName {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

var salary: Int? = nil

func paySalary(_ salary: Int?) {
    guard let unwrap = salary else {
        print("Nothing here!")
        return
    }
    print("Hello, \(unwrap)!")
}

//force unwrap
let unwrapSalary = salary!

