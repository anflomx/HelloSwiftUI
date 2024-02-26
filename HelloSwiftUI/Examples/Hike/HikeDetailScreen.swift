//
//  HikeDetailScreen.swift
//  HelloSwiftUI
//
//  Created by Antonio Flores on 28/01/24.
//

import SwiftUI

struct HikeDetailScreen: View {
    let hike: Hike
    @State private var zoomed: Bool = false
    
    var body: some View {
        VStack {
            Image(hike.photo)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        zoomed.toggle()
                    }
                }
            Text(hike.name)
                .font(.title)
            Text("\(hike.miles.formatted()) miles")
            Spacer()
        }.navigationTitle(hike.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct HikeDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HikeDetailScreen(hike: Hike(name: "111", photo: "mountain", miles: 6))
        }
    }
}
