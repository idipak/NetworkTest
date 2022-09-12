//
//  UserList.swift
//  NetworkTest
//
//  Created by Codebucket on 10/09/22.
//

import SwiftUI

struct UserList: View {
    @StateObject private var service = UserService2()
    
    var body: some View {
        List(service.users){ user in
            HStack{
                Text(user.name)
                Text(user.email)
            }
        }
        .onAppear(){
        
//            service.anotherGetUser()
        }
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}
