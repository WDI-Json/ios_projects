//
//  TodoAPIImpl.swift
//  KataCoreData1
//
//  Created by Wouter on 11/06/2022.
//

import Foundation

enum APIserviceError: Error {
case badUrl, requestError, decodingError, statusNotOK
}

struct TodoAPIImpl: ToDoDataSource {
    
    func getTodos() async throws -> [Todo] {
        guard let url = URL(string: "\(Constants.BASE_URL)/todos") else {
            throw APIserviceError.badUrl
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else {
            throw APIserviceError.requestError
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIserviceError.statusNotOK
        }
        
        guard let result = try? JSONDecoder().decode([TodoAPIEntity].self, from: data) else {
            throw APIserviceError.decodingError
        }
        
        return result.map({ item in
            Todo(
                id: item.id,
                title: item.title,
                isCompleted: item.completed
            )
        })
    }
}
