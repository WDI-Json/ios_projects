import UIKit
import ComposableArchitecture

let store = Store<Int, Void>(initialValue: 0, reducer: { count, _ in count += 1 })


store.send(())
store.send(())
store.send(())
store.send(())
store.send(())

store.value

let newStore = store.view { $0 }

newStore.value // 5
