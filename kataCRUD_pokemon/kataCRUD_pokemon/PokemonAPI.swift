//
//  DataManager.swift
//  kataCRUD_pokemon
//
//  Created by Wouter on 24/06/2022.
//

import Foundation

class PokemonAPI {
    
    func getAll(completion: @escaping ([PokemonEntry]) -> Void) {
        guard let url = URL(string: "http://localhost:5000/api/Pokemon") else {return}
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.timeoutInterval = 60
        request.httpMethod = "GET"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = "".data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Something went wrong with fetching all pokemon! Description: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("response = \(String(describing: response))")
                return
            }
            
            guard let data = data else { return }
            do {
                let listOfPokemon = try JSONDecoder().decode([PokemonEntry].self, from: data)
                DispatchQueue.main.async {
                    completion(listOfPokemon)
                }
            } catch {
                print(error.localizedDescription)
                return
            }
        }.resume()
    }
    
}
