//
//  UserService.swift
//  NetworkTest
//
//  Created by Codebucket on 09/09/22.
//

import Foundation

class UserService: ObservableObject{
    
    @Published var users: [User] = []
    
    func getUser(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        
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
                    self.users = decodedData
                } catch let e{
                    print(e)
                }
            }

        }
        dataTask.resume()
    }
    
}
