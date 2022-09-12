//
//  UserService.swift
//  NetworkTest
//
//  Created by Codebucket on 09/09/22.
//

import Foundation

class UserService: ObservableObject{
    
    @Published var users: [User] = []
    
    let rawUrl = "https://jsonplaceholder.typicode.com/users"
    
    func getUser(){
        guard let url = URL(string: rawUrl) else {return}
        
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            if response.statusCode == 200{
                guard let data = data else {
                    return
                }

                do{
                    let decodedData = try JSONDecoder().decode([User].self, from: data)
                    DispatchQueue.main.async {
                        self.users = decodedData
                    }
                } catch let e{
                    print(e)
                }
            }

        }
        dataTask.resume()
    }
    
    func getUserCompletion(completion: @escaping (Result<[User], Error>) -> Void){
        guard let url = URL(string: rawUrl) else {
            completion(.failure(UserFetchError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(UserFetchError.missingData))
                return
            }
            
            if response.statusCode == 200{
                guard let data = data else {
                    return
                }

                do{
                    let decodedResult = try JSONDecoder().decode([User].self, from: data)
                    completion(.success(decodedResult))
                } catch{
                    completion(.failure(error))
                }
            }
        }.resume()
        
    }
    
    func getUserWithAsync() async throws -> [User]{
        guard let url = URL(string: rawUrl) else {throw UserFetchError.invalidURL}
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decodedData = try JSONDecoder().decode([User].self, from: data)
        return decodedData
    }
    
    
    enum UserFetchError: Error{
        case invalidURL
        case missingData
    }
    
}
