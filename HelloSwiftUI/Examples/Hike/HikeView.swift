//
//  HikeView.swift
//  HelloSwiftUI
//
//  Created by Antonio Flores on 29/01/24.
//

import SwiftUI

struct HikeView: View {
    let hikes = [
        Hike(name: "111", photo: "mountain", miles: 6),
        Hike(name: "222", photo: "m2", miles: 5),
        Hike(name: "333", photo: "m3", miles: 4)
    ]
    
    var body: some View {
        NavigationStack {
            List(hikes) { hike in
                NavigationLink(value: hike) {
                    HikeCellView(hike: hike)
                }
            }.navigationTitle("Hikes")
                .navigationDestination(for: Hike.self) { hike in
                    HikeDetailScreen(hike: hike)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        HikeView()
    }
}

struct HikeCellView: View {
    let hike: Hike
    
    var body: some View {
        HStack(alignment: .top) {
            Image(hike.photo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .frame(width: 100)
            
            VStack(alignment: .leading) {
                Text(hike.name)
                Text("\(hike.miles.formatted()) miles")
            }
        }
    }
}
