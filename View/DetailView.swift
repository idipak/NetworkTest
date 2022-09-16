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
            Image(systemName: "star.fill")
                .frame(width: 32, height: 32)
                .foregroundColor(Color.blue)
                .onTapGesture {
                    if repo.chackFav(id: user.id){
                        repo.removeFav(id: user.id)
                    } else {
                        repo.addToFavorite(id: user.id)
                    }
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
