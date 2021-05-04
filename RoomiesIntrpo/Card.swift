//
//  Card.swift
//  RoomiesIntrpo
//
//  Created by ECC Student on 5/2/21.
//

import Foundation
import SwiftUI


struct CardView: View {

    let scrum: MatchingCards
    
    var body: some View{
        VStack(alignment: .leading) {
            Text(scrum.name[1])
            Text(scrum.bio[1])
                .font(.headline)
            Spacer()
            HStack {
                Label("\(scrum.name.count)", systemImage: "person.3")
                Spacer()
                Label("\(scrum.bio.count)", systemImage: "clock")
                    .padding(.trailing, 20)
            }
            .font(.caption)
        }

//        .padding()
//        .foregroundColor(scrum.color.accessibleFontColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = MatchingCards.data[0]
    static var previews: some View {
        Group {
            CardView(scrum: scrum)
//                .background(scrum.color)
                .previewLayout(.fixed(width: 400, height: 250))
        }
    }
}
