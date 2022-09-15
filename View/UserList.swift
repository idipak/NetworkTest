//
//  UserList.swift
//  NetworkTest
//
//  Created by Codebucket on 10/09/22.
//

import SwiftUI

struct UserList: View {
    @StateObject private var repo = Repository()
    
    var body: some View {
        List(repo.users){ user in
            NavigationLink {
                DetailView(isFav: .constant(true), user: user)
            } label: {
                ListItem(title: user.name, subTitle: user.email)
            }

        }
        .onAppear(){
            
            Task{
                await repo.asyncRequest()
            }
        
//            service.anotherGetUser()
        }
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}
