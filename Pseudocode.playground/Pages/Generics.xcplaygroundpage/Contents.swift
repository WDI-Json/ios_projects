//: [Previous](@previous)

import Foundation



struct User: Codable {
    let name: String
    let uuid: String
}

struct Planning: Codable {
    let dayPart: String
    let day: String
}

class DataStore<Element>: ObservableObject {
    @Published var dataArray: [Element] = []

    public func appendData(data: [Element]) {
        dataArray.append(contentsOf: data)
    }

    public func clearStore() {
        dataArray.removeAll()
    }
}
let users = [User(name: "Bob", uuid: "sdajdasjdasd"),User(name: "Bob", uuid: "sdajdasjdasd"),User(name: "Bob", uuid: "sdajdasjdasd"),User(name: "Bob", uuid: "sdajdasjdasd")]
let planning = [Planning(dayPart: "Midday", day: "Monday")]

var userStore = DataStore<User>()
print(userStore.dataArray.count)
var planningStore = DataStore<Planning>()
print(planningStore.dataArray.count)

userStore.appendData(data: users)
print(userStore.dataArray.count)

planningStore.appendData(data: planning)
print(planningStore.dataArray.count)

