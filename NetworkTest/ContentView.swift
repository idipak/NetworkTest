//
//  ContentView.swift
//  NetworkTest
//
//  Created by Codebucket on 09/09/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var service: UserService
    
    var body: some View {
        List(service.users){user in
            HStack{
                Text("\(user.name)")
                    .font(.body)
                Text(user.email)
                    .font(.caption)
            }
        }.onAppear(){
            service.getUser()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserService())
    }
}
