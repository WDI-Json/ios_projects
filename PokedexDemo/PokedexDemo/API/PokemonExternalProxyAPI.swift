//
//  PokemonExternalProxyAPI.swift
//  PokedexDemo
//
//  Created by Wouter on 11/07/2022.
//

import Foundation

class PokemonExternalProxyAPI {
    
    func getAll(completion: @escaping ([PokemonEntry]) -> Void) {
        guard let url = URL(string: "http://localhost:5000/api/Pokemon") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching pokemon: \(error)")
                return
            }
            
            guard let data = data else { return }
            do {
                let pokemonResultsList = try JSONDecoder().decode([PokemonEntry].self, from: data)
                DispatchQueue.main.async {
                    completion(pokemonResultsList)
                }
            } catch {
                print(error)
                print("Error decoding Pokemon: \(error.localizedDescription)")
                return
            }
        }.resume()
    }
    
    func getPokedex(completion: @escaping ([PokedexEntry]) -> Void) {
        guard let url = URL(string: "http://localhost:5000/api/Pokemon/pokedex") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching pokedex: \(error)")
                return
            }
            
            guard let data = data else { return }
            do {
                let pokedex = try JSONDecoder().decode([PokedexEntry].self, from: data)
                DispatchQueue.main.async {
                    completion(pokedex)
                }
            } catch {
                print(error)
                print("Error decoding PokedexEntry: \(error.localizedDescription)")
                return
            }
        }.resume()
    }
    
    func savePokemonInPokedex(withID pokemonID: Int, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "http://localhost:5000/api/Pokemon/\(pokemonID)/pokedex") else { return }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.timeoutInterval = 60
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = "".data(using: .utf8)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error fetching pokedex: \(error)")
                DispatchQueue.main.async { completion(false) }
            }
            
            // todo handle 400 (bad request == already in pokedex)
            //      body of response is "Pokemon already caught"
                        
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("response = \(String(describing: response))")
                DispatchQueue.main.async { completion(false) }
                return
            }
            DispatchQueue.main.async { completion(true) }
        }.resume()
    }
    
    func removePokemonFromPokedex(withID pokemonID: Int, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "http://localhost:5000/api/Pokemon/\(pokemonID)/pokedex") else { return }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.timeoutInterval = 60
        request.httpMethod = "DELETE"

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error doing DELETE pokedex: \(error)")
                DispatchQueue.main.async { completion(false) }
            }
                     
            // todo handle 400 (bad request == already in pokedex)
            //      body of response is "Pokemon already deleted or not there"
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("DELETE response = \(String(describing: response))")
                DispatchQueue.main.async { completion(false) }
                return
            }
            DispatchQueue.main.async { completion(true) }
        }.resume()
    }
}
