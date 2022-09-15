//
//  NetworkTestApp.swift
//  NetworkTest
//
//  Created by Codebucket on 09/09/22.
//

import SwiftUI

@main
struct NetworkTestApp: App {
    var userServie = UserService()
    @StateObject var repo = Repository()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                UserList()
                    .environmentObject(repo)
            }
//            ContentView()
//                .environmentObject(userServie)
        }
    }
}
