//
//  ListItem.swift
//  NetworkTest
//
//  Created by Codebucket on 13/09/22.
//

import SwiftUI

struct ListItem: View {
    let title: String
    let subTitle: String
    
    var body: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2)
                Text(subTitle)
                    .font(.footnote)
            }
            Spacer()
            Image(systemName: "arrow.forward.circle")
        }
        .padding(.horizontal)
        .frame(height: 80)
        .background(Color.mint)
        
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(title: "Title", subTitle: "Subtitle")
    }
}
