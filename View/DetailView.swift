//
//  DetailView.swift
//  NetworkTest
//
//  Created by Codebucket on 14/09/22.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var repo: Repository
    @Binding var isFav: Bool
    let user: User
    var body: some View {
        VStack{
            Text(user.name)
            Toggle(isOn: $isFav) {
                Text("Favorite")
            }
        }.padding()
        .onAppear{
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
            isFav: .constant(true),
            user: User(id: 2, name: "Bob", email: "abc@gmail.com")
        )
            .environmentObject(Repository())
    }
}
