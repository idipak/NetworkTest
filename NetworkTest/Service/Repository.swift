//
//  UserService2.swift
//  NetworkTest
//
//  Created by Codebucket on 10/09/22.
//

import Foundation


class Repository: ObservableObject{
    let service = UserService()
    
    @Published var users: [User] = []
    @Published var favoriteIDList: [Int] = []
    
    func addToFavorite(id: Int){
        favoriteIDList.append(id)
    }
    
    func removeFav(id: Int){
        favoriteIDList.removeAll {$0 == id}
    }
    
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
