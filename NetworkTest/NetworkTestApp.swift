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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userServie)
        }
    }
}
