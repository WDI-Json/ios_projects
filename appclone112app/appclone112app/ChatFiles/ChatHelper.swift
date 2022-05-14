//
//  ChatHelper.swift
//  appclone112app
//
//  Created by Wouter on 14/05/2022.
//

import Combine

class ChatHelper : ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
    @Published var realTimeMessages = DataSource.messages
    
    func sendMessage(_ chatMessage: Message) {
        realTimeMessages.append(chatMessage)
        didChange.send(())
    }
}
