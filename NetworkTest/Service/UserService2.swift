//
//  UserService2.swift
//  NetworkTest
//
//  Created by Codebucket on 10/09/22.
//

import Foundation


class UserService2: ObservableObject{
    let service = UserService()
    
    @Published var users: [User] = []
    
    func anotherGetUser(){
        service.getUserCompletion {[weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.users = data
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func asyncRequest() async -> Void{
        do{
            let data = try await service.getUserWithAsync()
            users = data
        } catch{
            print(error)
        }
    }
}
